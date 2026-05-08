#!/usr/bin/env python3
"""
FHIR CapabilityStatement Expander

This script expands a FHIR CapabilityStatement by recursively resolving all imports
and copying all referenced profiles, examples, and terminology resources.
"""

import json
import os
import shutil
import argparse
import sys
import tempfile
from pathlib import Path
from typing import Dict, List, Set, Any
import logging
import copy
from enum import Enum

# Version
__version__ = "0.7.15"

# Constants
class Expectation(Enum):
    """Import expectation levels in FHIR CapabilityStatements
    
    Hierarchy (higher strength = stronger expectation):
    SHALL (4) > SHOULD (3) > MAY (2) > SHOULD-NOT (1)
    """
    SHALL = 'SHALL'
    SHOULD = 'SHOULD'
    MAY = 'MAY'
    SHOULD_NOT = 'SHOULD-NOT'
    
    @property
    def strength(self) -> int:
        """Returns the numeric strength of this expectation level"""
        strength_map = {
            'SHALL': 4,
            'SHOULD': 3,
            'MAY': 2,
            'SHOULD-NOT': 1
        }
        return strength_map.get(self.value, 0)
    
    @staticmethod
    def get_strength(expectation: str) -> int:
        """Returns the numeric strength of an expectation string
        
        Args:
            expectation: Expectation value ('SHALL', 'SHOULD', 'MAY', 'SHOULD-NOT', or None)
            
        Returns:
            Numeric strength (4-0), where 0 means no expectation
        """
        if expectation is None:
            return 0
        strength_map = {
            'SHALL': 4,
            'SHOULD': 3,
            'MAY': 2,
            'SHOULD-NOT': 1
        }
        return strength_map.get(expectation, 0)

class ReferenceKeys:
    """Common reference keys in FHIR resources"""
    SUPPORTED_PROFILE = 'supportedProfile'
    PROFILE = 'profile'
    TARGET_PROFILE = 'targetProfile'
    VALUE_SET = 'valueSet'
    BINDING = 'binding'
    SYSTEM = 'system'
    SEARCH_PARAM = 'searchParam'
    DEFINITION = 'definition'
    INTERACTION = 'interaction'
    EXTENSION = 'extension'
    MODIFIER_EXTENSION = 'modifierExtension'
    OPERATION = 'operation'
    COMPARTMENT = 'compartment'
    IMPORTS = 'imports'
    INSTANTIATES = 'instantiates'
    BASE_DEFINITION = 'baseDefinition'

class ResourceTypes:
    """FHIR resource types"""
    CAPABILITY_STATEMENT = 'CapabilityStatement'
    STRUCTURE_DEFINITION = 'StructureDefinition'
    VALUE_SET = 'ValueSet'
    CODE_SYSTEM = 'CodeSystem'
    SEARCH_PARAMETER = 'SearchParameter'

# FHIR Definition resource types that MUST use canonical URLs (not FHIR references)
DEFINITION_TYPES = {
    'StructureDefinition', 'ValueSet', 'CodeSystem', 'SearchParameter',
    'OperationDefinition', 'CapabilityStatement', 'CompartmentDefinition',
    'ConceptMap', 'ImplementationGuide', 'MessageDefinition', 'NamingSystem',
    'StructureMap', 'TerminologyCapabilities', 'TestScript'
}

# FHIR Core base resource URL patterns (resources not expected in input directory)
FHIR_CORE_PATTERNS = [
    'http://hl7.org/fhir/StructureDefinition/',
    'http://terminology.hl7.org/',
    'http://hl7.org/fhir/SearchParameter/'
]

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class CapabilityStatementExpander:
    def __init__(self, input_dir: str, output_dir: str, capability_statement_urls: List[str], verbose: bool = False, clean_output: bool = True, expectation_filter: str = None):
        self.input_dir = Path(input_dir)
        self.output_dir = Path(output_dir)
        self.capability_statement_urls = capability_statement_urls if isinstance(capability_statement_urls, list) else [capability_statement_urls]
        self.verbose = verbose
        self.clean_output = clean_output
        self.expectation_filter = expectation_filter.upper() if expectation_filter else None  # None = import all
        self.processed_imports: Set[str] = set()
        self.referenced_resources: Set[str] = set()
        self.imported_capability_statements: Set[str] = set()  # Track imported CapabilityStatements
        self.original_capability_statements: Set[str] = set()  # Track original CapabilityStatements to expand
        self.current_import_expectation: str = Expectation.SHALL.value  # Track current import's expectation during expansion
        self.circular_refs_reported: Set[str] = set()  # Track reported circular references to avoid duplicate warnings
        self.all_resources: Dict[str, Dict] = {}
        self.resources_by_url: Dict[str, Dict] = {}  # Index for canonical URLs
        
        # Expectation hierarchy: SHALL > SHOULD > MAY
        # Note: SHOULD-NOT is never imported
        self.expectation_hierarchy = {
            Expectation.SHALL.value: [Expectation.SHALL.value],
            Expectation.SHOULD.value: [Expectation.SHALL.value, Expectation.SHOULD.value],
            Expectation.MAY.value: [Expectation.SHALL.value, Expectation.SHOULD.value, Expectation.MAY.value]
        }
        
        # Track processed files for reporting
        self.expanded_files: List[Dict] = []
        self.copied_files: List[Dict] = []
        
    def get_expectation_from_extensions(self, obj: Any) -> str:
        """Extracts expectation value from capabilitystatement-expectation extension
        
        Returns: 'SHALL', 'SHOULD', 'MAY', 'SHOULD-NOT', or None
        """
        if not isinstance(obj, dict):
            return None
        
        extensions = obj.get('extension', [])
        if not isinstance(extensions, list):
            return None
        
        for ext in extensions:
            if isinstance(ext, dict) and 'expectation' in ext.get('url', '').lower():
                return ext.get('valueCode')
        
        return None
    
    def is_stronger_expectation(self, new_expectation: str, existing_expectation: str) -> bool:
        """Checks if new expectation is stronger than existing one
        
        SHALL (4) > SHOULD (3) > MAY (2) > SHOULD-NOT (1)
        """
        return Expectation.get_strength(new_expectation) > Expectation.get_strength(existing_expectation)
    
    def should_import_expectation(self, expectation: str) -> bool:
        """Check if an import with given expectation should be processed based on filter
        
        Args:
            expectation: The expectation value (SHALL, SHOULD, MAY, SHOULD-NOT)
            
        Returns:
            True if the import should be processed, False otherwise
        """
        # SHOULD-NOT is never imported
        if expectation == Expectation.SHOULD_NOT.value:
            return False
        
        # No filter = import everything (except SHOULD-NOT)
        if self.expectation_filter is None:
            return True
        
        # Check if expectation is in the allowed list for the filter
        allowed_expectations = self.expectation_hierarchy.get(self.expectation_filter, [])
        return expectation in allowed_expectations
    
    def load_all_resources(self):
        """Loads all JSON resources from the input directory"""
        logger.info(f"Loading resources from {self.input_dir}")
        
        for json_file in self.input_dir.glob("**/*.json"):
            try:
                with open(json_file, 'r', encoding='utf-8') as f:
                    resource = json.load(f)
                    
                if isinstance(resource, dict) and 'resourceType' in resource:
                    resource_id = resource.get('id', json_file.stem)
                    self.all_resources[resource_id] = {
                        'resource': resource,
                        'file_path': json_file,
                        'relative_path': json_file.relative_to(self.input_dir)
                    }
                    
                    # Index also by canonical URL if available
                    canonical_url = resource.get('url')
                    if canonical_url:
                        self.resources_by_url[canonical_url] = self.all_resources[resource_id]
                    
                    logger.debug(f"Loaded: {resource['resourceType']}/{resource_id}" + 
                               (f" ({canonical_url})" if canonical_url else ""))
                    
            except (json.JSONDecodeError, KeyError) as e:
                logger.warning(f"Could not load {json_file} as FHIR resource: {e}")
                
        logger.info(f"Total {len(self.all_resources)} resources loaded")
    
    def find_capability_statements(self) -> List[Dict]:
        """Finds all specified CapabilityStatements by canonical URLs"""
        logger.info(f"Searching for {len(self.capability_statement_urls)} CapabilityStatement(s)")
        
        found_statements = []
        
        for cs_url in self.capability_statement_urls:
            logger.info(f"Searching for CapabilityStatement with URL: {cs_url}")
            cs = self._find_single_capability_statement(cs_url)
            if cs:
                found_statements.append(cs)
            else:
                raise FileNotFoundError(f"CapabilityStatement not found: {cs_url}")
        
        return found_statements
    
    def _find_single_capability_statement(self, capability_statement_url: str) -> Dict:
        """Finds a single CapabilityStatement by canonical URL"""
        
        # First search by canonical URL
        if capability_statement_url in self.resources_by_url:
            resource_info = self.resources_by_url[capability_statement_url]
            cs = resource_info['resource']
            
            if cs.get('resourceType') != ResourceTypes.CAPABILITY_STATEMENT:
                raise ValueError(f"Resource with URL {capability_statement_url} is not a CapabilityStatement")
                
            logger.info(f"CapabilityStatement found: {cs.get('id')} ({capability_statement_url})")
            return cs
        
        # Fallback: Search by ID if no URL provided
        # (for backward compatibility)
        if capability_statement_url in self.all_resources:
            resource_info = self.all_resources[capability_statement_url]
            cs = resource_info['resource']
            
            if cs.get('resourceType') != ResourceTypes.CAPABILITY_STATEMENT:
                raise ValueError(f"Resource with ID {capability_statement_url} is not a CapabilityStatement")
                
            logger.info(f"CapabilityStatement found by ID: {cs.get('id')}")
            return cs
            
        # Try partial URL matches
        for url, resource_info in self.resources_by_url.items():
            if capability_statement_url in url or url.endswith(capability_statement_url):
                cs = resource_info['resource']
                if cs.get('resourceType') == ResourceTypes.CAPABILITY_STATEMENT:
                    logger.info(f"CapabilityStatement found by URL match: {cs.get('id')} ({url})")
                    return cs
        
        return None    
    
    def extract_imports(self, resource: Dict) -> List[tuple]:
        """Extracts all import references from a resource with their expectations
        
        Returns: List of tuples (import_url, expectation) where expectation is 'SHALL' or 'MAY'
        """
        imports = []
        
        # Search for imports in various contexts
        if ReferenceKeys.IMPORTS in resource:
            import_list = resource[ReferenceKeys.IMPORTS] if isinstance(resource[ReferenceKeys.IMPORTS], list) else [resource[ReferenceKeys.IMPORTS]]
            
            # Check for _imports with expectation extensions
            _imports = resource.get('_imports', [])
            if not isinstance(_imports, list):
                _imports = [_imports]
            
            for i, import_url in enumerate(import_list):
                expectation = 'SHALL'  # Default expectation
                
                # Try to find expectation in _imports
                if i < len(_imports) and _imports[i]:
                    extensions = _imports[i].get('extension', [])
                    for ext in extensions:
                        if 'expectation' in ext.get('url', '').lower():
                            expectation = ext.get('valueCode', 'SHALL').upper()
                            break
                
                imports.append((import_url, expectation))
        
        # Search for instantiates (extended CapabilityStatements)
        if ReferenceKeys.INSTANTIATES in resource:
            instantiate_list = resource[ReferenceKeys.INSTANTIATES] if isinstance(resource[ReferenceKeys.INSTANTIATES], list) else [resource[ReferenceKeys.INSTANTIATES]]
            # Instantiates are always treated as SHALL
            for inst_url in instantiate_list:
                imports.append((inst_url, Expectation.SHALL.value))
        
        return imports
    
    def resolve_reference(self, reference: str) -> str:
        """Resolves a reference to a resource ID or URL"""
        # Return the complete reference for URL-based search
        return reference.strip()
    
    def expand_capability_statement(self, cs: Dict, visited: Set[str] = None) -> Dict:
        """Expands a CapabilityStatement recursively by resolving all imports"""
        if visited is None:
            visited = set()
            
        cs_id = cs.get('id', 'unknown')
        if cs_id in visited:
            logger.warning(f"Circular reference detected for CapabilityStatement: {cs_id}")
            return cs
            
        visited.add(cs_id)
        logger.info(f"Expanding CapabilityStatement: {cs_id}")
        
        # Create a copy for expansion
        expanded_cs = copy.deepcopy(cs)
        
        # Extract imports with expectations
        imports = self.extract_imports(cs)
        
        for import_ref, expectation in imports:
            import_id = self.resolve_reference(import_ref)

            # Check if this expectation should be imported based on filter BEFORE
            # marking it as processed, so a URL filtered at a weaker expectation
            # level can still be picked up if referenced again at a stronger level.
            should_import = self.should_import_expectation(expectation)

            if not should_import:
                logger.info(f"Import with {expectation} expectation: {import_id} (SKIPPED by expectation filter '{self.expectation_filter}')")
                continue

            if import_id in self.processed_imports:
                continue

            self.processed_imports.add(import_id)

            logger.info(f"Import with {expectation} expectation: {import_id} (resources will be collected)")

            # Search for the imported CapabilityStatement
            imported_resource_info = None
            
            # First search by canonical URL
            if import_id in self.resources_by_url:
                imported_resource_info = self.resources_by_url[import_id]
            # Fallback by ID
            elif import_id in self.all_resources:
                imported_resource_info = self.all_resources[import_id]
            # Try to match URL fragments
            else:
                for url, resource_info in self.resources_by_url.items():
                    if import_id in url or url.endswith(import_id.split('/')[-1]):
                        imported_resource_info = resource_info
                        break
                        
                # Fallback: Also search in IDs for the last URL segment
                if not imported_resource_info:
                    fragment = import_id.split('/')[-1]
                    if fragment in self.all_resources:
                        imported_resource_info = self.all_resources[fragment]
            
            if imported_resource_info:
                imported_resource = imported_resource_info['resource']
                
                if imported_resource.get('resourceType') == ResourceTypes.CAPABILITY_STATEMENT:
                    # Add the imported CapabilityStatement to imported_capability_statements set
                    canonical_url = imported_resource.get('url')
                    if canonical_url:
                        self.imported_capability_statements.add(canonical_url)
                    else:
                        # If no canonical URL, use the resource ID
                        resource_id = imported_resource.get('id')
                        if resource_id:
                            self.imported_capability_statements.add(resource_id)
                    
                    # Set current expectation context
                    previous_expectation = self.current_import_expectation
                    self.current_import_expectation = expectation
                    
                    # Recursively expand
                    imported_expanded = self.expand_capability_statement(imported_resource, visited.copy())
                    
                    # Restore previous expectation
                    self.current_import_expectation = previous_expectation
                    
                    # Merge the contents
                    self.merge_capability_statements(expanded_cs, imported_expanded)
                    
                    logger.info(f"Import resolved: {import_id}")
                else:
                    logger.warning(f"Import is not a CapabilityStatement: {import_id}")
            else:
                logger.warning(f"Import not found: {import_id}")
        
        # Collect all referenced resources (based on expectation filter)
        if self.should_import_expectation(self.current_import_expectation):
            self.collect_referenced_resources(expanded_cs)
        else:
            logger.info(f"Skipping resource collection for {cs_id} ({self.current_import_expectation} expectation filtered out)")
        
        # Remove imports and _imports after expansion
        self.clean_expanded_capability_statement(expanded_cs)
        
        return expanded_cs
    
    def clean_expanded_capability_statement(self, cs: Dict):
        """Removes imports and _imports from the expanded CapabilityStatement"""
        # Remove imports as they have already been resolved
        if ReferenceKeys.IMPORTS in cs:
            del cs[ReferenceKeys.IMPORTS]
        
        # Remove _imports as they have already been resolved
        if '_imports' in cs:
            del cs['_imports']
        
        logger.debug("Removed imports and _imports from expanded CapabilityStatement")
    
    def merge_capability_statements(self, target: Dict, source: Dict):
        """Merges two CapabilityStatements together"""
        
        # Merge rest resources
        if 'rest' in source:
            if 'rest' not in target:
                target['rest'] = []
            
            for source_rest in source['rest']:
                # Find or create matching rest entry
                target_rest = None
                for tr in target['rest']:
                    if tr.get('mode') == source_rest.get('mode'):
                        target_rest = tr
                        break
                
                if target_rest is None:
                    target['rest'].append(copy.deepcopy(source_rest))
                else:
                    # Merge resources
                    if 'resource' in source_rest:
                        if 'resource' not in target_rest:
                            target_rest['resource'] = []
                        
                        for source_resource in source_rest['resource']:
                            # Deduplication based on type
                            existing = next((r for r in target_rest['resource'] 
                                           if r.get('type') == source_resource.get('type')), None)
                            
                            if existing is None:
                                target_rest['resource'].append(copy.deepcopy(source_resource))
                            else:
                                # Merge supportedProfile and other resource-level fields
                                self.merge_supported_profiles(existing, source_resource)
                                self.merge_resource_fields(existing, source_resource)
                    
                    # Merge other rest-level fields (interaction, searchParam, operation, etc.)
                    for key, value in source_rest.items():
                        if key not in ['mode', 'resource']:  # Skip mode (already matched) and resource (already merged)
                            if key not in target_rest:
                                target_rest[key] = copy.deepcopy(value)
                            elif isinstance(value, list) and isinstance(target_rest[key], list):
                                # Merge lists (e.g., interaction, searchParam, operation)
                                target_rest[key].extend(copy.deepcopy(value))
        
        # Merge messaging
        if 'messaging' in source:
            if 'messaging' not in target:
                target['messaging'] = source['messaging']
            else:
                # More complex messaging merge could be implemented here
                pass
    
    def merge_supported_profiles(self, target_resource: Dict, source_resource: Dict):
        """Merges supportedProfile arrays between two resources
        
        Also synchronizes _supportedProfile element extensions to maintain parallel array structure.
        In FHIR, arrays starting with _ are element extensions and must be the same length as their main field.
        
        If a profile exists in both target and source with different expectations, the stronger
        expectation wins (SHALL > SHOULD > MAY > SHOULD-NOT).
        """
        if 'supportedProfile' in source_resource:
            if 'supportedProfile' not in target_resource:
                target_resource['supportedProfile'] = []
            
            # Track initial length to know where to append _supportedProfile extensions
            initial_length = len(target_resource['supportedProfile'])
            
            for profile in source_resource['supportedProfile']:
                if profile not in target_resource['supportedProfile']:
                    target_resource['supportedProfile'].append(profile)
            
            # Synchronize _supportedProfile element extensions
            # Element extensions must be parallel arrays (same length as main field)
            if '_supportedProfile' in source_resource:
                if '_supportedProfile' not in target_resource:
                    # Initialize with null entries for existing profiles
                    target_resource['_supportedProfile'] = [None] * initial_length
                
                # For each new profile added, append corresponding extension (or null)
                source_profiles = source_resource['supportedProfile']
                source_extensions = source_resource['_supportedProfile']
                
                for i, profile in enumerate(source_profiles):
                    # Find where this profile is in target
                    try:
                        target_index = target_resource['supportedProfile'].index(profile)
                        
                        # Get expectations from both source and target
                        source_ext = source_extensions[i] if i < len(source_extensions) else None
                        source_expectation = self.get_expectation_from_extensions(source_ext)
                        
                        target_ext = target_resource['_supportedProfile'][target_index] if target_index < len(target_resource['_supportedProfile']) else None
                        target_expectation = self.get_expectation_from_extensions(target_ext)
                        
                        # Update extension if:
                        # 1. We added this profile (index >= initial_length), OR
                        # 2. Source has stronger expectation than target
                        should_update = (target_index >= initial_length or 
                                       self.is_stronger_expectation(source_expectation, target_expectation))
                        
                        if should_update:
                            # Ensure _supportedProfile is long enough
                            while len(target_resource['_supportedProfile']) <= target_index:
                                target_resource['_supportedProfile'].append(None)
                            
                            # Copy extension from source (or null if not present)
                            if source_ext:
                                target_resource['_supportedProfile'][target_index] = copy.deepcopy(source_ext)
                            else:
                                target_resource['_supportedProfile'][target_index] = None
                    except ValueError:
                        # Profile not found (shouldn't happen, but defensive)
                        continue
            
            # Ensure _supportedProfile matches supportedProfile length (pad with null if needed)
            if '_supportedProfile' in target_resource:
                profile_count = len(target_resource['supportedProfile'])
                extension_count = len(target_resource['_supportedProfile'])
                
                if extension_count < profile_count:
                    # Pad with null to match
                    target_resource['_supportedProfile'].extend([None] * (profile_count - extension_count))
                elif extension_count > profile_count:
                    # Trim excess (shouldn't happen, but defensive)
                    target_resource['_supportedProfile'] = target_resource['_supportedProfile'][:profile_count]
    
    def merge_resource_fields(self, target_resource: Dict, source_resource: Dict):
        """Merges additional fields from source resource into target resource
        
        For complex objects (searchParam, interaction, operation), deduplication is based on key fields:
        - searchParam: 'name' field
        - interaction: 'code' field
        - operation: 'name' field
        - extension/modifierExtension: 'url' field
        
        For simple string arrays (searchInclude, searchRevInclude), exact string matching is used.
        """
        # List of fields that should be merged as lists (appending, not replacing)
        list_fields = ['interaction', 'searchParam', 'searchInclude', 'searchRevInclude', 
                      'operation', 'extension', 'modifierExtension']
        
        # Key fields for deduplication of complex objects
        dedup_keys = {
            'searchParam': 'name',
            'interaction': 'code',
            'operation': 'name',
            'extension': 'url',
            'modifierExtension': 'url'
        }
        
        for key, value in source_resource.items():
            if key in ['type', 'supportedProfile']:  # Already handled elsewhere
                continue
            
            # Skip FHIR element extensions (fields starting with _) - they need special handling
            # These are parallel arrays to their main field and must be synchronized separately
            if key.startswith('_'):
                continue
            
            if key not in target_resource:
                # Field doesn't exist in target, just copy it
                target_resource[key] = copy.deepcopy(value)
            elif key in list_fields and isinstance(value, list) and isinstance(target_resource[key], list):
                # Merge lists with smart deduplication
                if key in dedup_keys:
                    # Complex objects - deduplicate by key field with expectation upgrade
                    dedup_key = dedup_keys[key]
                    
                    # Build index of existing items by key
                    existing_items = {}
                    for idx, item in enumerate(target_resource[key]):
                        if isinstance(item, dict) and dedup_key in item:
                            existing_items[item[dedup_key]] = idx
                    
                    for item in value:
                        if isinstance(item, dict) and dedup_key in item:
                            item_key = item[dedup_key]
                            
                            if item_key in existing_items:
                                # Item exists - check if we need to upgrade expectation
                                existing_idx = existing_items[item_key]
                                existing_item = target_resource[key][existing_idx]
                                
                                source_expectation = self.get_expectation_from_extensions(item)
                                existing_expectation = self.get_expectation_from_extensions(existing_item)
                                
                                # Upgrade if source has stronger expectation
                                if self.is_stronger_expectation(source_expectation, existing_expectation):
                                    logger.debug(f"Upgrading expectation for {key}.{item_key}: {existing_expectation} → {source_expectation}")
                                    target_resource[key][existing_idx] = copy.deepcopy(item)
                            else:
                                # New item - add it
                                target_resource[key].append(copy.deepcopy(item))
                                existing_items[item_key] = len(target_resource[key]) - 1
                        else:
                            # Item without key field (shouldn't happen, but defensive)
                            if item not in target_resource[key]:
                                target_resource[key].append(copy.deepcopy(item))
                else:
                    # Simple values (strings) - exact match deduplication
                    for item in value:
                        if item not in target_resource[key]:
                            target_resource[key].append(copy.deepcopy(item))
            # For other fields, keep target value (don't override)
    
    def collect_referenced_resources(self, cs: Dict):
        """Collects all resources referenced in a CapabilityStatement.

        When an expectation_filter is active, supportedProfile entries whose
        individual _supportedProfile expectation does NOT meet the filter are
        silently skipped.  All other reference types (valueSet, searchParam,
        operation, …) are not individually annotated in the FHIR spec, so they
        are always collected.
        """

        def _profile_expectation_ok(parent_obj: Dict, profile_index: int) -> bool:
            """Returns True if the profile at the given index should be included.

            Checks the parallel _supportedProfile array for a
            capabilitystatement-expectation extension on the element.
            If no expectation is present (= implicit SHALL), it always passes.
            """
            if self.expectation_filter is None:
                return True
            shadow = parent_obj.get('_supportedProfile')
            if not shadow or not isinstance(shadow, list):
                return True  # no per-element annotation → always include
            if profile_index >= len(shadow):
                return True
            elem = shadow[profile_index]
            expectation = self.get_expectation_from_extensions(elem) if elem else None
            if not expectation:
                return True  # no annotation → treat as SHALL
            return self.should_import_expectation(expectation)

        def extract_references(obj: Any, path: str = ""):
            if isinstance(obj, dict):
                for key, value in obj.items():
                    # Profile-Referenzen
                    if key in [ReferenceKeys.SUPPORTED_PROFILE, ReferenceKeys.PROFILE, ReferenceKeys.TARGET_PROFILE]:
                        if isinstance(value, list):
                            for idx, ref in enumerate(value):
                                # For supportedProfile, honour per-element expectation filter
                                if key == ReferenceKeys.SUPPORTED_PROFILE:
                                    if not _profile_expectation_ok(obj, idx):
                                        logger.debug(
                                            f"Skipping supportedProfile[{idx}] '{ref}' "
                                            f"(expectation below filter '{self.expectation_filter}')"
                                        )
                                        continue
                                self.referenced_resources.add(self.resolve_reference(ref))
                        else:
                            self.referenced_resources.add(self.resolve_reference(value))
                    
                    # ValueSet-Referenzen
                    elif key in [ReferenceKeys.VALUE_SET, ReferenceKeys.BINDING]:
                        if isinstance(value, dict) and ReferenceKeys.VALUE_SET in value:
                            # Binding with valueSet
                            self.referenced_resources.add(self.resolve_reference(value[ReferenceKeys.VALUE_SET]))
                        elif isinstance(value, str):
                            self.referenced_resources.add(self.resolve_reference(value))
                    
                    # CodeSystem-Referenzen (nur in spezifischen Kontexten)
                    elif key == ReferenceKeys.SYSTEM and isinstance(value, str):
                        # Nur in bestimmten Kontexten CodeSystems sammeln
                        context_path = path.lower()
                        if any(ctx in context_path for ctx in ['binding', 'searchparam', 'valueset', 'extension']):
                            self.referenced_resources.add(self.resolve_reference(value))
                    
                    # SearchParameter-Referenzen
                    elif key == ReferenceKeys.SEARCH_PARAM and isinstance(value, list):
                        for param in value:
                            if isinstance(param, dict):
                                # SearchParameter Definition URL
                                if ReferenceKeys.DEFINITION in param:
                                    self.referenced_resources.add(self.resolve_reference(param[ReferenceKeys.DEFINITION]))
                                # Binding in SearchParameter
                                if ReferenceKeys.BINDING in param and isinstance(param[ReferenceKeys.BINDING], dict):
                                    if ReferenceKeys.VALUE_SET in param[ReferenceKeys.BINDING]:
                                        self.referenced_resources.add(self.resolve_reference(param[ReferenceKeys.BINDING][ReferenceKeys.VALUE_SET]))
                    
                    # Interaction-spezifische Profile
                    elif key == ReferenceKeys.INTERACTION and isinstance(value, list):
                        for interaction in value:
                            if isinstance(interaction, dict) and ReferenceKeys.PROFILE in interaction:
                                self.referenced_resources.add(self.resolve_reference(interaction[ReferenceKeys.PROFILE]))
                    
                    # Extension-Referenzen
                    elif key in [ReferenceKeys.EXTENSION, ReferenceKeys.MODIFIER_EXTENSION] and isinstance(value, list):
                        for ext in value:
                            if isinstance(ext, dict) and 'url' in ext:
                                ext_url = ext['url']
                                resolved_ref = self.resolve_reference(ext_url)
                                
                                # Special logging for ISiKTerminPriorityExtension
                                if 'ISiKTerminPriorityExtension' in ext_url:
                                    logger.warning(f"⚠️  ISiKTerminPriorityExtension found at path '{path}': {ext_url}")
                                    logger.warning(f"    Resolved to: {resolved_ref}")
                                    logger.warning(f"    Current import expectation: {self.current_import_expectation}")
                                
                                logger.info(f"🔍 Extension found at path '{path}': {ext_url} → {resolved_ref}")
                                self.referenced_resources.add(resolved_ref)
                    
                    # Operation-Definition Referenzen
                    elif key == ReferenceKeys.OPERATION and isinstance(value, list):
                        for op in value:
                            if isinstance(op, dict) and ReferenceKeys.DEFINITION in op:
                                self.referenced_resources.add(self.resolve_reference(op[ReferenceKeys.DEFINITION]))
                    
                    # Compartment-Referenzen
                    elif key == ReferenceKeys.COMPARTMENT and isinstance(value, list):
                        for comp in value:
                            if isinstance(comp, str):
                                self.referenced_resources.add(self.resolve_reference(comp))
                    
                    # Search nested resources
                    else:
                        extract_references(value, f"{path}.{key}")
                        
            elif isinstance(obj, list):
                for i, item in enumerate(obj):
                    extract_references(item, f"{path}[{i}]")
        
        extract_references(cs)
        logger.info(f"Referenced resources collected: {len(self.referenced_resources)}")
        logger.debug(f"Referenzen: {sorted(list(self.referenced_resources))}")
        
        # Resolve nested references and parent profile hierarchies to a fixed point.
        # This ensures that parent profiles discovered in later passes are analyzed too.
        self.resolve_references_to_fixpoint()
        
        # Collect examples based on meta.profile
        self.collect_examples_by_meta_profile()

    def resolve_references_to_fixpoint(self):
        """Resolves nested references and parent profile hierarchies until stable."""
        max_passes = 10
        
        for pass_num in range(1, max_passes + 1):
            initial_count = len(self.referenced_resources)
            
            # Pass A: extract nested references from currently known resources
            self.iterative_reference_extraction()
            
            # Pass B: add full parent profile chains for referenced StructureDefinitions
            self.collect_parent_profiles()
            
            final_count = len(self.referenced_resources)
            added = final_count - initial_count
            
            if added > 0:
                logger.info(f"Reference resolution pass {pass_num}: {added} additional resources")
            else:
                logger.info(f"Reference resolution pass {pass_num}: no additional resources, fixed point reached")
                break
        else:
            logger.warning(f"Maximum pass count reached during reference resolution ({max_passes})")
    
    def iterative_reference_extraction(self):
        """Iteratively extracts all nested references from ValueSets, SearchParameters, and StructureDefinitions"""
        max_iterations = 10
        iteration = 0
        analyzed_resources = set()
        
        while iteration < max_iterations:
            initial_count = len(self.referenced_resources)
            resources_to_analyze = []
            
            # Collect NEW resources (not yet analyzed)
            for resource_ref in sorted(list(self.referenced_resources)):
                if resource_ref in analyzed_resources:
                    continue
                    
                resource_info = self.find_resource_by_reference(resource_ref)
                if resource_info:
                    resource_type = resource_info['resource'].get('resourceType')
                    if resource_type in [ResourceTypes.VALUE_SET, ResourceTypes.SEARCH_PARAMETER, ResourceTypes.STRUCTURE_DEFINITION]:
                        resources_to_analyze.append(resource_info['resource'])
                        analyzed_resources.add(resource_ref)
            
            # Analyze resources for additional references
            for resource in resources_to_analyze:
                resource_id = resource.get('id', resource.get('url', 'unknown'))
                resource_type = resource.get('resourceType')
                
                if resource_type == ResourceTypes.VALUE_SET:
                    logger.info(f"🔍 Analyzing ValueSet: {resource_id}")
                    self.extract_codesystems_from_valueset(resource)
                elif resource_type == ResourceTypes.SEARCH_PARAMETER:
                    logger.info(f"🔍 Analyzing SearchParameter: {resource_id}")
                    self.extract_references_from_searchparameter(resource)
                elif resource_type == ResourceTypes.STRUCTURE_DEFINITION:
                    logger.info(f"🔍 Analyzing StructureDefinition: {resource_id}")
                    self.extract_bindings_from_structuredefinition(resource)
                    self.extract_type_profiles_from_structuredefinition(resource)
            
            new_count = len(self.referenced_resources)
            if new_count > initial_count:
                logger.info(f"Iteration {iteration + 1}: {new_count - initial_count} additional resources extracted")
                iteration += 1
            else:
                # No new references found, end iteration
                break
        
        if iteration >= max_iterations:
            logger.warning(f"Maximum iteration count reached during reference extraction")
    
    def extract_bindings_from_structuredefinitions(self):
        """Extracts ValueSet/CodeSystem references from StructureDefinition bindings"""
        for resource_ref in sorted(list(self.referenced_resources)):
            resource_info = self.find_resource_by_reference(resource_ref)
            if resource_info and resource_info['resource'].get('resourceType') == ResourceTypes.STRUCTURE_DEFINITION:
                self.extract_bindings_from_structuredefinition(resource_info['resource'])
    
    def extract_type_profiles_from_structuredefinitions(self):
        """Extracts profile references from StructureDefinition type[].profile arrays"""
        for resource_ref in sorted(list(self.referenced_resources)):
            resource_info = self.find_resource_by_reference(resource_ref)
            if resource_info and resource_info['resource'].get('resourceType') == ResourceTypes.STRUCTURE_DEFINITION:
                self.extract_type_profiles_from_structuredefinition(resource_info['resource'])
    
    def extract_bindings_from_structuredefinition(self, structdef: Dict):
        """Extracts ValueSet references from the bindings of a StructureDefinition"""
        structdef_url = structdef.get('url', structdef.get('id', 'unknown'))
        logger.info(f"📦 Analyzing StructureDefinition for bindings: {structdef_url}")
        
        def extract_bindings_recursive(obj: Any, path: str = ""):
            if isinstance(obj, dict):
                for key, value in obj.items():
                    if key == ReferenceKeys.BINDING and isinstance(value, dict):
                        # Binding found - extract ValueSet
                        if ReferenceKeys.VALUE_SET in value and isinstance(value[ReferenceKeys.VALUE_SET], str):
                            valueset_ref = self.resolve_reference(value[ReferenceKeys.VALUE_SET])
                            self.referenced_resources.add(valueset_ref)
                            logger.info(f"  ✅ ValueSet from binding in {structdef_url}: {valueset_ref}")
                    # Also check for extension URLs in the StructureDefinition itself
                    elif key == 'url' and isinstance(value, str) and 'Extension' in value:
                        logger.info(f"  ℹ️  Extension URL in StructureDefinition {structdef_url}: {value}")
                    else:
                        extract_bindings_recursive(value, f"{path}.{key}")
            elif isinstance(obj, list):
                for i, item in enumerate(obj):
                    extract_bindings_recursive(item, f"{path}[{i}]")
        
        extract_bindings_recursive(structdef)
    
    def extract_type_profiles_from_structuredefinition(self, structdef: Dict):
        """Extracts profile references from type[].profile arrays in a StructureDefinition"""
        structdef_url = structdef.get('url', structdef.get('id', 'unknown'))
        logger.debug(f"🔍 Analyzing StructureDefinition for type profiles: {structdef_url}")
        
        def extract_type_profiles_recursive(obj: Any, path: str = ""):
            if isinstance(obj, dict):
                # Check if this is a type element with profile
                if 'code' in obj and ReferenceKeys.PROFILE in obj:
                    # This is a type[] element with profile (e.g., {"code": "Coding", "profile": ["url"]})
                    profiles = obj[ReferenceKeys.PROFILE]
                    if isinstance(profiles, list):
                        for profile_url in profiles:
                            if isinstance(profile_url, str):
                                profile_ref = self.resolve_reference(profile_url)
                                self.referenced_resources.add(profile_ref)
                                logger.info(f"  ✅ Profile from type[] in {structdef_url}: {profile_ref}")
                    elif isinstance(profiles, str):
                        profile_ref = self.resolve_reference(profiles)
                        self.referenced_resources.add(profile_ref)
                        logger.info(f"  ✅ Profile from type[] in {structdef_url}: {profile_ref}")
                
                # Continue recursively through all nested objects
                for key, value in obj.items():
                    extract_type_profiles_recursive(value, f"{path}.{key}")
            elif isinstance(obj, list):
                for i, item in enumerate(obj):
                    extract_type_profiles_recursive(item, f"{path}[{i}]")
        
        extract_type_profiles_recursive(structdef)
    
    def collect_parent_profiles(self):
        """Collects all parent profiles recursively from referenced StructureDefinitions"""
        logger.info("Collecting parent profiles from StructureDefinitions")
        
        # Get all currently referenced StructureDefinitions
        structuredefs_to_process = []
        for resource_ref in sorted(list(self.referenced_resources)):
            resource_info = self.find_resource_by_reference(resource_ref)
            if resource_info and resource_info['resource'].get('resourceType') == ResourceTypes.STRUCTURE_DEFINITION:
                structuredefs_to_process.append((resource_ref, resource_info['resource']))
        
        total_parents_found = 0
        
        # Process each StructureDefinition and collect its complete parent hierarchy
        for resource_ref, structdef in structuredefs_to_process:
            parents_found = self.extract_parent_profile_recursive(structdef, resource_ref)
            total_parents_found += parents_found
        
        if total_parents_found > 0:
            logger.info(f"Total parent profiles found: {total_parents_found}")
        
        logger.info("Parent profile collection completed")
    
    def extract_parent_profile_recursive(self, structdef: Dict, profile_ref: str, depth: int = 0, max_depth: int = 50, visited: Set[str] = None) -> int:
        """Recursively extracts all parent profiles (baseDefinition) from a StructureDefinition hierarchy
        
        Returns the number of parent profiles found in this hierarchy
        """
        if visited is None:
            visited = set()
        
        # Prevent infinite recursion
        if depth >= max_depth:
            logger.warning(f"Maximum recursion depth ({max_depth}) reached for profile: {profile_ref}")
            return 0
        
        base_definition = structdef.get(ReferenceKeys.BASE_DEFINITION)
        
        if not base_definition:
            # No parent profile defined - end of hierarchy
            return 0
        
        # Check for circular references
        if base_definition in visited:
            # Only log once per unique circular reference to avoid spam
            if base_definition not in self.circular_refs_reported:
                logger.debug(f"Circular reference detected: {base_definition} (FHIR core base resource)")
                self.circular_refs_reported.add(base_definition)
            return 0
        
        visited.add(base_definition)
        
        # Check if the parent profile is already in our referenced resources
        if base_definition in self.referenced_resources:
            # Already collected, but we still need to check its parents
            parent_resource_info = self.find_resource_by_reference(base_definition)
            if parent_resource_info and parent_resource_info['resource'].get('resourceType') == 'StructureDefinition':
                # Continue with parent's parent
                return self.extract_parent_profile_recursive(parent_resource_info['resource'], base_definition, depth + 1, max_depth, visited)
            return 0
        
        # Try to find the parent profile in our resources
        parent_resource_info = self.find_resource_by_reference(base_definition)
        
        if parent_resource_info:
            # Parent profile found in our resources
            if parent_resource_info['resource'].get('resourceType') == ResourceTypes.STRUCTURE_DEFINITION:
                self.referenced_resources.add(base_definition)
                logger.info(f"Parent profile added: {base_definition} (parent of {profile_ref})")
                
                # Recursively collect parent's parents
                parents_found = 1 + self.extract_parent_profile_recursive(
                    parent_resource_info['resource'], 
                    base_definition, 
                    depth + 1, 
                    max_depth, 
                    visited
                )
                return parents_found
            else:
                # Don't warn for FHIR core base resources
                is_fhir_core = any(base_definition.startswith(pattern) for pattern in FHIR_CORE_PATTERNS)
                if not is_fhir_core:
                    logger.warning(f"Base definition is not a StructureDefinition: {base_definition}")
                else:
                    logger.debug(f"Base definition is FHIR core resource: {base_definition}")
                return 0
        else:
            # Parent profile not found - check if it's a FHIR core resource
            is_fhir_core = any(base_definition.startswith(pattern) for pattern in FHIR_CORE_PATTERNS)
            if is_fhir_core:
                logger.debug(f"Parent is FHIR core resource (not in input): {base_definition}")
            else:
                logger.warning(f"Parent profile not found: {base_definition} (parent of {profile_ref})")
            return 0
    
    def collect_examples_by_meta_profile(self):
        """Collects Examples based on meta.profile references to already referenced profiles"""
        logger.info("Searching for examples based on meta.profile references")
        
        initial_count = len(self.referenced_resources)
        examples_found = 0
        
        # Create set of all already referenced profile URLs
        referenced_profiles = set()
        for resource_ref in self.referenced_resources:
            # Normalize the reference for comparisons
            referenced_profiles.add(resource_ref)
        
        # Search all resources for meta.profile
        for resource_id, resource_info in self.all_resources.items():
            resource = resource_info['resource']
            
            # Skip StructureDefinitions - they are definitions, not examples
            if resource.get('resourceType') == ResourceTypes.STRUCTURE_DEFINITION:
                continue
            
            # Check if the resource has meta.profile
            if 'meta' in resource and 'profile' in resource.get('meta', {}):
                profiles = resource['meta']['profile']
                
                # Normalize to list
                if isinstance(profiles, str):
                    profiles = [profiles]
                elif not isinstance(profiles, list):
                    continue
                
                # Check if one of the profiles is already referenced
                for profile_url in profiles:
                    normalized_profile = self.resolve_reference(profile_url)
                    
                    if normalized_profile in referenced_profiles:
                        # This resource uses a referenced profile -> is an Example
                        # Use ResourceType/ID format for proper FHIR reference matching
                        resource_type = resource.get('resourceType', 'Unknown')
                        example_ref = f"{resource_type}/{resource_id}"
                        
                        if example_ref not in self.referenced_resources:
                            self.referenced_resources.add(example_ref)
                            examples_found += 1
                            
                            logger.info(f"Example found via meta.profile: {example_ref} → Profile: {profile_url}")
                            break  # One match is enough to classify the resource as an example
        
        logger.info(f"Meta.profile analysis completed: {examples_found} examples found")
        
        final_count = len(self.referenced_resources)
        if final_count > initial_count:
            logger.info(f"Total {final_count - initial_count} additional resources added via meta.profile")
    
    def extract_references_from_searchparameter(self, searchparam: Dict):
        """Extracts references from a SearchParameter"""
        def extract_refs_recursive(obj: Any):
            if isinstance(obj, dict):
                for key, value in obj.items():
                    if key == ReferenceKeys.VALUE_SET and isinstance(value, str):
                        self.referenced_resources.add(self.resolve_reference(value))
                        logger.debug(f"ValueSet extracted from SearchParameter: {value}")
                    elif key == ReferenceKeys.SYSTEM and isinstance(value, str):
                        self.referenced_resources.add(self.resolve_reference(value))
                        logger.debug(f"CodeSystem extracted from SearchParameter: {value}")
                    else:
                        extract_refs_recursive(value)
            elif isinstance(obj, list):
                for item in obj:
                    extract_refs_recursive(item)
        
        extract_refs_recursive(searchparam)
    
    def extract_codesystems_from_valueset(self, valueset: Dict):
        """Extracts CodeSystem references from a single ValueSet"""
        def extract_systems_recursive(obj: Any):
            if isinstance(obj, dict):
                for key, value in obj.items():
                    if key == ReferenceKeys.SYSTEM and isinstance(value, str):
                        # CodeSystem URL found
                        self.referenced_resources.add(self.resolve_reference(value))
                        logger.debug(f"CodeSystem extracted from ValueSet: {value}")
                    elif key == ReferenceKeys.VALUE_SET and isinstance(value, str):
                        # Reference to other ValueSets (for compose.include)
                        self.referenced_resources.add(self.resolve_reference(value))
                    else:
                        extract_systems_recursive(value)
            elif isinstance(obj, list):
                for item in obj:
                    extract_systems_recursive(item)
        
        extract_systems_recursive(valueset)
    
    def find_resource_by_reference(self, resource_ref: str) -> Dict:
        """Finds a resource by reference (URL or ID)
        
        Matching strategies:
        1. Exact canonical URL match (for StructureDefinitions, ValueSets, etc.)
           - Multiple resources with same URL but different versions: continues search if version mismatch
        2. FHIR Reference format with ResourceType validation (for resource instances)
           - Relative: "Patient/patient-123"
           - Absolute: "http://base/fhir/Patient/patient-123"
           - Validates: resourceType matches AND ID matches
        
        Conformance resources (StructureDefinition, ValueSet, etc.) MUST use canonical URLs.
        Resource instances (Patient, Observation, etc.) MUST use ResourceType/ID format.
        Version suffixes (e.g., '|1.0.0') are validated against resource.version.
        
        Examples:
        - "http://example.org/StructureDefinition/Patient" → Strategy 1 (canonical URL)
        - "Patient/patient-123" → Strategy 2 (FHIR reference with type validation)
        - "http://base/fhir/Patient/patient-123" → Strategy 2 (absolute FHIR reference)
        - "patient-123" → FAILS (requires ResourceType, e.g., "Patient/patient-123")
        - "PatientProfile" → FAILS (StructureDefinition requires canonical URL)
        """
        # Parse version suffix if present (e.g., "http://example.org/Patient|1.0.0")
        requested_version = None
        base_ref = resource_ref
        if '|' in resource_ref:
            base_ref, requested_version = resource_ref.rsplit('|', 1)
        
        # Strategy 1: Exact canonical URL match (for profiles, ValueSets, etc.)
        # Note: There may be multiple resources with the same URL but different versions
        if base_ref in self.resources_by_url:
            resource_info = self.resources_by_url[base_ref]
            
            # Validate version if specified
            if requested_version:
                resource_version = resource_info['resource'].get('version')
                if resource_version != requested_version:
                    logger.debug(f"Version mismatch for {base_ref}: requested '{requested_version}', found '{resource_version}', continuing search...")
                    # Don't return None here - there might be another resource with the same URL but different version
                    # Fall through to other strategies
                else:
                    logger.debug(f"✅ Reference found via exact canonical URL with matching version: {base_ref}|{requested_version}")
                    return resource_info
            else:
                logger.debug(f"✅ Reference found via exact canonical URL: {base_ref}")
                return resource_info
        
        # Strategy 2: FHIR Reference Format (ResourceType/ID)
        # Examples:
        # - "Patient/patient-123" (relative FHIR reference)
        # - "http://example.org/fhir/Patient/patient-123" (absolute FHIR reference)
        
        is_url = base_ref.startswith('http://') or base_ref.startswith('https://')
        
        if is_url:
            # Absolute FHIR reference: http://base/fhir/ResourceType/ID
            parts = base_ref.split('/')
            if len(parts) >= 2:
                resource_type = parts[-2]
                resource_id = parts[-1]
                
                # Skip FHIR reference matching for definition resource types
                if resource_type in DEFINITION_TYPES:
                    logger.debug(f"⚠️  Definition resource type '{resource_type}' requires canonical URL, not found: {base_ref}")
                    return None
                
                logger.debug(f"🔍 Attempting FHIR reference match for absolute URL: {base_ref} → {resource_type}/{resource_id}")
                
                # Find resource with matching ID and resourceType
                if resource_id in self.all_resources:
                    resource_info = self.all_resources[resource_id]
                    actual_type = resource_info['resource'].get('resourceType')
                    
                    if actual_type == resource_type:
                        # Validate version if specified
                        if requested_version:
                            resource_version = resource_info['resource'].get('version')
                            if resource_version != requested_version:
                                logger.error(f"Version mismatch for {resource_type}/{resource_id}: requested '{requested_version}', but resource has version '{resource_version}'")
                                return None
                        
                        logger.debug(f"✅ Reference found via FHIR reference (absolute): {resource_type}/{resource_id}")
                        return resource_info
                    else:
                        logger.debug(f"⚠️  ResourceType mismatch: expected '{resource_type}', found '{actual_type}'")
            
            # No match for canonical URL or absolute reference
            logger.debug(f"⚠️  URL reference not found: {base_ref}")
            return None
        
        # Relative FHIR reference: ResourceType/ID
        if '/' in base_ref:
            parts = base_ref.split('/')
            if len(parts) == 2:
                resource_type, resource_id = parts
                logger.debug(f"🔍 Attempting FHIR reference match for relative reference: {resource_type}/{resource_id}")
                
                # Find resource with matching ID and resourceType
                if resource_id in self.all_resources:
                    resource_info = self.all_resources[resource_id]
                    actual_type = resource_info['resource'].get('resourceType')
                    
                    if actual_type == resource_type:
                        # Validate version if specified
                        if requested_version:
                            resource_version = resource_info['resource'].get('version')
                            if resource_version != requested_version:
                                logger.error(f"Version mismatch for {resource_type}/{resource_id}: requested '{requested_version}', but resource has version '{resource_version}'")
                                return None
                        
                        logger.debug(f"✅ Reference found via FHIR reference (relative): {resource_type}/{resource_id}")
                        return resource_info
                    else:
                        logger.debug(f"⚠️  ResourceType mismatch: expected '{resource_type}', found '{actual_type}'")
        
        # Not found
        logger.debug(f"⚠️  Reference not found: {base_ref}")
        return None
    
    def copy_referenced_resources(self):
        """Copies all referenced resources to the output directory"""
        logger.info(f"Kopiere {len(self.referenced_resources)} referenzierte Ressourcen")
        
        # Output directory already created in run(), no need to clean here
        
        copied_count = 0
        skipped_fhir_core = 0
        skipped_not_found = 0
        
        for resource_ref in sorted(self.referenced_resources):
            # Skip FHIR core resources (not expected to be in input directory)
            is_fhir_core = any(resource_ref.startswith(pattern) for pattern in FHIR_CORE_PATTERNS)
            if is_fhir_core:
                skipped_fhir_core += 1
                logger.debug(f"Skipped FHIR core resource: {resource_ref}")
                continue
            
            resource_info = self.find_resource_by_reference(resource_ref)
            
            if resource_info:
                source_path = resource_info['file_path']
                relative_path = resource_info['relative_path']
                
                # Copy all files flat into output directory (without subdirectories)
                filename = os.path.basename(source_path)
                target_path = self.output_dir / filename
                
                # Create target directory
                target_path.parent.mkdir(parents=True, exist_ok=True)
                
                # Copy file
                shutil.copy2(source_path, target_path)
                copied_count += 1
                
                # Track copied file
                resource_type = resource_info['resource'].get('resourceType', 'Unknown')
                self.copied_files.append({
                    'filename': os.path.basename(target_path),
                    'relative_path': os.path.basename(target_path),  # Flache Struktur
                    'size': os.path.getsize(target_path),
                    'resource_type': resource_type
                })
                
                logger.debug(f"Copied: {filename}")
            else:
                skipped_not_found += 1
                logger.warning(f"Referenced resource not found: {resource_ref}")
        
        logger.info(f"{copied_count} files copied, {skipped_fhir_core} FHIR core resources skipped, {skipped_not_found} not found")
    
    def copy_imported_capability_statements(self):
        """Copies all imported CapabilityStatements to the output directory"""
        logger.info(f"Kopiere {len(self.imported_capability_statements)} importierte CapabilityStatements")
        
        # Create output directory
        self.output_dir.mkdir(parents=True, exist_ok=True)
        
        copied_count = 0
        for cs_ref in sorted(self.imported_capability_statements):
            # Skip if this is one of the original CapabilityStatements we're expanding
            if cs_ref in self.original_capability_statements:
                logger.debug(f"Skipping original CapabilityStatement: {cs_ref}")
                continue
            
            resource_info = self.find_resource_by_reference(cs_ref)
            
            if resource_info:
                source_path = resource_info['file_path']
                
                # Copy all files flat into output directory (without subdirectories)
                filename = os.path.basename(source_path)
                target_path = self.output_dir / filename
                
                # Create target directory
                target_path.parent.mkdir(parents=True, exist_ok=True)
                
                # Copy file
                shutil.copy2(source_path, target_path)
                copied_count += 1
                
                # Track copied file
                resource_type = resource_info['resource'].get('resourceType', 'Unknown')
                self.copied_files.append({
                    'filename': os.path.basename(target_path),
                    'relative_path': os.path.basename(target_path),  # Flache Struktur
                    'size': os.path.getsize(target_path),
                    'resource_type': resource_type
                })
                
                logger.info(f"Copied imported CapabilityStatement: {filename}")
            else:
                logger.warning(f"Imported CapabilityStatement not found: {cs_ref}")
        
        logger.info(f"{copied_count} imported CapabilityStatements copied")
    
    def copy_original_capability_statement(self, cs: Dict):
        """Copies the original CapabilityStatement to the output directory"""
        logger.info("Kopiere das ursprüngliche CapabilityStatement")
        
        # Create output directory
        self.output_dir.mkdir(parents=True, exist_ok=True)
        
        # Find the original CapabilityStatement file
        cs_url = cs.get('url')
        cs_id = cs.get('id')
        
        resource_info = None
        if cs_url and cs_url in self.resources_by_url:
            resource_info = self.resources_by_url[cs_url]
        elif cs_id and cs_id in self.all_resources:
            resource_info = self.all_resources[cs_id]
        
        if resource_info:
            source_path = resource_info['file_path']
            
            # Copy all files flat into output directory (without subdirectories)
            filename = os.path.basename(source_path)
            target_path = self.output_dir / filename
            
            # Create target directory
            target_path.parent.mkdir(parents=True, exist_ok=True)
            
            # Copy file
            shutil.copy2(source_path, target_path)
            
            # Track copied file
            resource_type = resource_info['resource'].get('resourceType', 'Unknown')
            self.copied_files.append({
                'filename': os.path.basename(target_path),
                'relative_path': os.path.basename(target_path),  # Flache Struktur
                'size': os.path.getsize(target_path),
                'resource_type': resource_type
            })
            
            logger.info(f"Copied original CapabilityStatement: {filename}")
        else:
            logger.warning("Original CapabilityStatement file not found for copying")
    
    def print_summary_report(self):
        """Prints a structured report of all processed files"""
        
        # Separate CapabilityStatements from other copied files
        capability_statements = [f for f in self.copied_files if f['resource_type'] == 'CapabilityStatement']
        other_resources = [f for f in self.copied_files if f['resource_type'] != 'CapabilityStatement']
        
        # Create JSON summary for action.yml parsing
        summary_data = {
            'expanded_files': self.expanded_files,
            'copied_files': self.copied_files,
            'total_expanded': len(self.expanded_files),
            'total_copied': len(self.copied_files),
            'total_capability_statements': len(capability_statements),
            'total_other_resources': len(other_resources),
            'total_files': len(self.expanded_files) + len(self.copied_files)
        }
        
        # Write JSON summary to temp file for action.yml to parse
        # Use temp directory to avoid committing the file
        temp_dir = Path(tempfile.gettempdir())
        summary_file = temp_dir / 'fhir-processing-summary.json'
        with open(summary_file, 'w', encoding='utf-8') as f:
            json.dump(summary_data, f, indent=2)
        
        logger.debug(f"Processing summary written to: {summary_file}")
        
        # Output the summary file path for GitHub Actions to use
        print(f"SUMMARY_FILE_PATH={summary_file}")
        
        # Only show verbose formatted output if requested
        if self.verbose:
            print("\n" + "📄 Processed FHIR Resources:")
            print("=" * 32)
            
            print("🔧 Expanded Resources:")
            for file in self.expanded_files:
                print(f"📋 {file['filename']} (expanded)")
            
            if capability_statements:
                print("\n📋 CapabilityStatements:")
                for file in capability_statements:
                    print(f"  📋 {file['filename']} [{file['resource_type']}]")
            
            print("\n📁 Copied Resources:")
            for file in other_resources:
                print(f"  📋 {file['filename']} [{file['resource_type']}]")
            
            print("\n" + "=" * 32)
            print("📊 Summary:")
            print(f"  🔧 Expanded: {len(self.expanded_files)} files")
            print(f"  📋 CapabilityStatements: {len(capability_statements)} files")
            print(f"  📁 Other Resources: {len(other_resources)} files")
            print(f"  📋 Total: {len(self.expanded_files) + len(self.copied_files)} files processed")
            
            print("\n📋 Processing Summary (JSON):")
            print(json.dumps(summary_data, indent=2))
    
    def save_expanded_capability_statement(self, expanded_cs: Dict):
        """Saves the expanded CapabilityStatement"""
        original_id = expanded_cs.get('id', 'unknown')
        expanded_id = f"{original_id}-expanded"
        
        # Update ID and metadata
        expanded_cs['id'] = expanded_id
        if 'name' in expanded_cs:
            expanded_cs['name'] = f"{expanded_cs['name']}Expanded"
        if 'title' in expanded_cs:
            expanded_cs['title'] = f"{expanded_cs['title']} (Expanded)"
        
        # Update canonical URL with -expanded suffix
        if 'url' in expanded_cs:
            original_url = expanded_cs['url']
            # Append -expanded to the URL (before any version suffix if present)
            if '|' in original_url:
                base_url, version = original_url.rsplit('|', 1)
                expanded_cs['url'] = f"{base_url}-expanded|{version}"
            else:
                expanded_cs['url'] = f"{original_url}-expanded"
        
        # Note: imports and _imports are already removed by clean_expanded_capability_statement()
        # No need to remove them again here
        
        # Save the expanded version
        output_file = self.output_dir / f"CapabilityStatement-{expanded_id}.json"
        output_file.parent.mkdir(parents=True, exist_ok=True)
        
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(expanded_cs, f, indent=2, ensure_ascii=False)
        
        logger.info(f"Expanded CapabilityStatement saved: {output_file}")
        
        # Track expanded file
        self.expanded_files.append({
            'filename': os.path.basename(output_file),
            'relative_path': os.path.relpath(output_file, self.output_dir),
            'size': os.path.getsize(output_file),
            'resource_type': 'CapabilityStatement'
        })
    
    def run(self):
        """Main execution of the expander"""
        try:
            logger.info(f"FHIR CapabilityStatement Expander v{__version__}")
            logger.info(f"Processing {len(self.capability_statement_urls)} CapabilityStatement(s)")
            logger.info("Starting CapabilityStatement expansion")
            
            # Clean output directory if requested (before any file operations)
            if self.clean_output:
                if self.output_dir.exists():
                    logger.info(f"Cleaning output directory: {self.output_dir}")
                    shutil.rmtree(self.output_dir)
            
            # Create output directory
            self.output_dir.mkdir(parents=True, exist_ok=True)
            
            # Load all resources
            self.load_all_resources()
            
            # Find all base CapabilityStatements
            base_capability_statements = self.find_capability_statements()
            
            # Process each CapabilityStatement
            for base_cs in base_capability_statements:
                logger.info(f"\n{'='*60}")
                logger.info(f"Processing CapabilityStatement: {base_cs.get('id')}")
                logger.info(f"{'='*60}")
                
                # Reset per-CS processing state (important for multiple CapabilityStatements!)
                # Each CapabilityStatement needs its own expansion context
                self.processed_imports = set()
                self.current_import_expectation = Expectation.SHALL.value
                
                # Track this as an original CapabilityStatement
                cs_url = base_cs.get('url')
                if cs_url:
                    self.original_capability_statements.add(cs_url)
                
                # Copy the original CapabilityStatement
                self.copy_original_capability_statement(base_cs)
                
                # Expand the CapabilityStatement
                expanded_cs = self.expand_capability_statement(base_cs)
                
                # Save the expanded CapabilityStatement
                self.save_expanded_capability_statement(expanded_cs)
            
            # Copy all imported CapabilityStatements (only once for all)
            self.copy_imported_capability_statements()
            
            # Copy all referenced resources (only once for all)
            self.copy_referenced_resources()
            
            # Print structured report
            self.print_summary_report()
            
            logger.info("CapabilityStatement expansion completed successfully")
            
        except Exception as e:
            logger.error(f"Error during expansion: {e}")
            raise

def main():
    parser = argparse.ArgumentParser(description='FHIR CapabilityStatement Expander')
    parser.add_argument('input_dir', help='Input directory with JSON files')
    parser.add_argument('output_dir', help='Output directory for expanded resources')
    parser.add_argument('capability_statement_url', help='Canonical URL(s) of the CapabilityStatement(s) to expand. Can be a single URL or a JSON array of URLs.')
    parser.add_argument('--verbose', '-v', action='store_true', help='Verbose logging')
    parser.add_argument('--no-clean', action='store_true', help='Do not clean output directory before expansion (by default, output directory is cleaned)')
    parser.add_argument('--expectation-filter', choices=['SHALL', 'SHOULD', 'MAY'], help='Filter imports by minimum expectation level. SHALL=only SHALL, SHOULD=SHALL+SHOULD, MAY=SHALL+SHOULD+MAY. Default: import all expectations (SHOULD-NOT is never imported).')
    
    args = parser.parse_args()
    
    if args.verbose:
        logging.getLogger().setLevel(logging.DEBUG)
    
    # Validate input directory
    if not os.path.isdir(args.input_dir):
        logger.error(f"Input directory does not exist: {args.input_dir}")
        sys.exit(1)
    
    # Parse capability_statement_url - can be a single URL, JSON array, or @file reference
    capability_statement_urls = args.capability_statement_url
    
    # Check if it's a file reference (@filename)
    if capability_statement_urls.startswith('@'):
        file_path = capability_statement_urls[1:]  # Remove @ prefix
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                capability_statement_urls = f.read().strip()
        except FileNotFoundError:
            logger.error(f"File not found: {file_path}")
            sys.exit(1)
        except Exception as e:
            logger.error(f"Error reading file {file_path}: {e}")
            sys.exit(1)
    
    # Try to parse as JSON array first
    if capability_statement_urls.startswith('['):
        try:
            capability_statement_urls = json.loads(capability_statement_urls)
            if not isinstance(capability_statement_urls, list):
                logger.error("capability_statement_url must be a string or JSON array")
                sys.exit(1)
        except json.JSONDecodeError as e:
            logger.error(f"Invalid JSON array for capability_statement_url: {e}")
            sys.exit(1)
    else:
        # Single URL - convert to list
        capability_statement_urls = [capability_statement_urls]
    
    # Create expander and execute
    expander = CapabilityStatementExpander(
        args.input_dir,
        args.output_dir, 
        capability_statement_urls,
        verbose=args.verbose,
        clean_output=not args.no_clean,  # Invert no_clean flag to get clean_output
        expectation_filter=args.expectation_filter
    )
    
    try:
        expander.run()
        logger.info("Expansion completed successfully")
    except Exception as e:
        logger.error(f"Expansion failed: {e}")
        sys.exit(1)

if __name__ == '__main__':
    main()
