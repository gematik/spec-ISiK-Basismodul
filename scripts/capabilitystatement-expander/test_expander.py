#!/usr/bin/env python3
"""
Comprehensive test suite for the FHIR CapabilityStatement Expander

Tests:
1. Basic expansion with examples directory
2. Expectation upgrade (SHALL > SHOULD > MAY > SHOULD-NOT)
3. Multi-level import chain expectation propagation
4. Reference matching strategies (canonical URLs, FHIR references, versioning)
"""

import os
import sys
import json
import tempfile
import shutil
import subprocess
import unittest
from pathlib import Path

# Import expander for direct testing
from capability_statement_expander import CapabilityStatementExpander

def test_basic_expansion():
    """Test basic expansion with examples directory"""
    print("\n" + "=" * 70)
    print("TEST 1: Basic Expansion")
    print("=" * 70)
    
    # Determine script directory
    script_dir = Path(__file__).parent
    expander_script = script_dir / "capability_statement_expander.py"
    examples_dir = script_dir / "examples"
    
    print(f"📁 Script directory: {script_dir}")
    print(f"📝 Expander script: {expander_script}")
    print(f"📂 Examples: {examples_dir}")
    
    # Check if files exist
    if not expander_script.exists():
        print(f"❌ Expander script not found: {expander_script}")
        return False
        
    if not examples_dir.exists():
        print(f"❌ Examples directory not found: {examples_dir}")
        return False
    
    # Create temporary output directory
    with tempfile.TemporaryDirectory() as temp_output:
        output_dir = Path(temp_output)
        
        print(f"📤 Output directory: {output_dir}")
        
        try:
            # Run the expander
            cmd = [
                sys.executable,
                str(expander_script),
                str(examples_dir),
                str(output_dir),
                "http://example.org/CapabilityStatement/example-base-capability",
                "--verbose"
            ]
            
            print(f"🚀 Executing: {' '.join(cmd)}")
            
            result = subprocess.run(cmd, capture_output=True, text=True)
            
            if result.returncode != 0:
                print(f"❌ Error executing script:")
                print(f"STDERR: {result.stderr}")
                return False
            
            print("✅ Script executed successfully")
            
            # Check output files
            expected_files = [
                "CapabilityStatement-example-base-capability-expanded.json"
            ]
            
            for expected_file in expected_files:
                file_path = output_dir / expected_file
                if not file_path.exists():
                    print(f"❌ Missing file: {expected_file}")
                    return False
                print(f"✅ File created: {expected_file}")
            
            # Show all created files
            all_files = list(output_dir.rglob("*.json"))
            print(f"\n📁 All created files ({len(all_files)}):")
            for file in sorted(all_files):
                relative_path = file.relative_to(output_dir)
                file_size = file.stat().st_size
                print(f"  📄 {relative_path} ({file_size} bytes)")
            
            print("\n✅ TEST 1 PASSED: Basic expansion works correctly")
            return True
            
        except Exception as e:
            print(f"❌ Unexpected error: {e}")
            return False

def test_expectation_upgrade():
    """Test that SHALL expectation upgrades MAY expectation"""
    print("\n" + "=" * 70)
    print("TEST 2: Expectation Upgrade (SHALL > MAY)")
    print("=" * 70)
    
    # Create test data with conflicting expectations
    test_cs_weak = {
        "resourceType": "CapabilityStatement",
        "id": "test-weak",
        "url": "http://test.example/CapabilityStatement/test-weak",
        "status": "active",
        "kind": "requirements",
        "fhirVersion": "4.0.1",
        "format": ["application/fhir+json"],
        "rest": [{
            "mode": "server",
            "resource": [{
                "type": "Patient",
                "supportedProfile": ["http://test.example/StructureDefinition/TestProfile"],
                "_supportedProfile": [{
                    "extension": [{
                        "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                        "valueCode": "MAY"
                    }]
                }],
                "searchParam": [{
                    "name": "identifier",
                    "type": "token",
                    "extension": [{
                        "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                        "valueCode": "MAY"
                    }]
                }]
            }]
        }]
    }
    
    test_cs_strong = {
        "resourceType": "CapabilityStatement",
        "id": "test-strong",
        "url": "http://test.example/CapabilityStatement/test-strong",
        "status": "active",
        "kind": "requirements",
        "fhirVersion": "4.0.1",
        "format": ["application/fhir+json"],
        "imports": ["http://test.example/CapabilityStatement/test-weak"],
        "rest": [{
            "mode": "server",
            "resource": [{
                "type": "Patient",
                "supportedProfile": ["http://test.example/StructureDefinition/TestProfile"],
                "_supportedProfile": [{
                    "extension": [{
                        "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                        "valueCode": "SHALL"
                    }]
                }],
                "searchParam": [{
                    "name": "identifier",
                    "type": "token",
                    "extension": [{
                        "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                        "valueCode": "SHALL"
                    }]
                }]
            }]
        }]
    }
    
    print("Setup:")
    print("  - Weak CS: Profile=MAY, SearchParam=MAY")
    print("  - Strong CS: Profile=SHALL, SearchParam=SHALL (imports Weak)")
    print("  - Expected: SHALL wins")
    
    # Create temp directories
    with tempfile.TemporaryDirectory() as input_dir, tempfile.TemporaryDirectory() as output_dir:
        input_path = Path(input_dir)
        output_path = Path(output_dir)
        
        # Write test files
        with open(input_path / "CapabilityStatement-test-weak.json", 'w') as f:
            json.dump(test_cs_weak, f, indent=2)
        
        with open(input_path / "CapabilityStatement-test-strong.json", 'w') as f:
            json.dump(test_cs_strong, f, indent=2)
        
        # Run expander
        expander = CapabilityStatementExpander(
            str(input_path),
            str(output_path),
            ["http://test.example/CapabilityStatement/test-strong"],
            verbose=False,
            clean_output=True
        )
        
        expander.run()
        
        # Check result
        expanded_file = output_path / "CapabilityStatement-test-strong-expanded.json"
        
        if not expanded_file.exists():
            print("❌ Expanded file not found!")
            return False
        
        with open(expanded_file) as f:
            expanded = json.load(f)
        
        # Check supportedProfile expectation
        profile_ext = expanded['rest'][0]['resource'][0]['_supportedProfile'][0]
        profile_expectation = None
        for ext in profile_ext.get('extension', []):
            if 'capabilitystatement-expectation' in ext.get('url', ''):
                profile_expectation = ext.get('valueCode')
        
        # Check searchParam expectation
        search_param = expanded['rest'][0]['resource'][0]['searchParam'][0]
        search_expectation = None
        for ext in search_param.get('extension', []):
            if 'capabilitystatement-expectation' in ext.get('url', ''):
                search_expectation = ext.get('valueCode')
        
        print(f"\nResults:")
        print(f"  supportedProfile expectation: {profile_expectation}")
        print(f"  searchParam expectation: {search_expectation}")
        
        # Verify
        if profile_expectation != "SHALL":
            print(f"❌ Profile expectation is {profile_expectation}, expected SHALL")
            return False
        
        if search_expectation != "SHALL":
            print(f"❌ SearchParam expectation is {search_expectation}, expected SHALL")
            return False
        
        print("\n✅ TEST 2 PASSED: Expectation upgrade works correctly")
        return True

def test_multi_level_expectation():
    """Test that SHALL expectation propagates through multiple import levels"""
    print("\n" + "=" * 70)
    print("TEST 3: Multi-Level Expectation Propagation")
    print("=" * 70)
    
    # CS3: Defines identifier with SHALL (deepest level)
    test_cs3 = {
        "resourceType": "CapabilityStatement",
        "id": "test-level3",
        "url": "http://test.example/CapabilityStatement/test-level3",
        "status": "active",
        "kind": "requirements",
        "fhirVersion": "4.0.1",
        "format": ["application/fhir+json"],
        "rest": [{
            "mode": "server",
            "resource": [{
                "type": "Patient",
                "searchParam": [{
                    "name": "identifier",
                    "type": "token",
                    "extension": [{
                        "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                        "valueCode": "SHALL"
                    }]
                }]
            }]
        }]
    }
    
    # CS2: Imports CS3 AND defines identifier with MAY (middle level)
    test_cs2 = {
        "resourceType": "CapabilityStatement",
        "id": "test-level2",
        "url": "http://test.example/CapabilityStatement/test-level2",
        "status": "active",
        "kind": "requirements",
        "fhirVersion": "4.0.1",
        "format": ["application/fhir+json"],
        "imports": ["http://test.example/CapabilityStatement/test-level3"],
        "rest": [{
            "mode": "server",
            "resource": [{
                "type": "Patient",
                "searchParam": [{
                    "name": "identifier",
                    "type": "token",
                    "extension": [{
                        "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                        "valueCode": "MAY"
                    }]
                }]
            }]
        }]
    }
    
    # CS1: Imports CS2 only (top level)
    test_cs1 = {
        "resourceType": "CapabilityStatement",
        "id": "test-level1",
        "url": "http://test.example/CapabilityStatement/test-level1",
        "status": "active",
        "kind": "requirements",
        "fhirVersion": "4.0.1",
        "format": ["application/fhir+json"],
        "imports": ["http://test.example/CapabilityStatement/test-level2"],
        "rest": [{
            "mode": "server"
        }]
    }
    
    print("Import chain:")
    print("  CS1 (Base)")
    print("   └─ imports CS2 (identifier: MAY)")
    print("       └─ imports CS3 (identifier: SHALL)")
    print("  Expected: CS1.identifier = SHALL")
    
    # Create temp directories
    with tempfile.TemporaryDirectory() as input_dir, tempfile.TemporaryDirectory() as output_dir:
        input_path = Path(input_dir)
        output_path = Path(output_dir)
        
        # Write test files
        (input_path / "CapabilityStatement-test-level3.json").write_text(json.dumps(test_cs3, indent=2))
        (input_path / "CapabilityStatement-test-level2.json").write_text(json.dumps(test_cs2, indent=2))
        (input_path / "CapabilityStatement-test-level1.json").write_text(json.dumps(test_cs1, indent=2))
        
        # Run expander
        expander = CapabilityStatementExpander(
            str(input_path),
            str(output_path),
            ["http://test.example/CapabilityStatement/test-level1"],
            verbose=False,
            clean_output=True
        )
        
        expander.run()
        
        # Check result
        expanded_file = output_path / "CapabilityStatement-test-level1-expanded.json"
        
        if not expanded_file.exists():
            print("❌ Expanded file not found!")
            return False
        
        with open(expanded_file) as f:
            expanded = json.load(f)
        
        # Check searchParam expectation
        resources = expanded['rest'][0].get('resource', [])
        if not resources:
            print("❌ No resources in expanded CS!")
            return False
        
        patient_resource = next((r for r in resources if r.get('type') == 'Patient'), None)
        if not patient_resource:
            print("❌ No Patient resource found!")
            return False
        
        search_params = patient_resource.get('searchParam', [])
        identifier_param = next((p for p in search_params if p.get('name') == 'identifier'), None)
        
        if not identifier_param:
            print("❌ identifier searchParam not found!")
            return False
        
        # Extract expectation
        expectation = None
        for ext in identifier_param.get('extension', []):
            if 'capabilitystatement-expectation' in ext.get('url', ''):
                expectation = ext.get('valueCode')
        
        print(f"\nResult: identifier expectation = {expectation}")
        
        # Verify
        if expectation != "SHALL":
            print(f"❌ Expected SHALL, got {expectation}")
            return False
        
        print("\n✅ TEST 3 PASSED: Multi-level expectation propagation works correctly")
        return True

def test_reference_matching():
    """Test reference matching strategies using examples/ directory resources"""
    print("\n" + "=" * 70)
    print("TEST 4: Reference Matching Strategies")
    print("=" * 70)
    
    script_dir = Path(__file__).parent
    examples_dir = script_dir / "examples"
    
    print(f"📂 Examples directory: {examples_dir}")
    
    # Create temp output directory
    with tempfile.TemporaryDirectory() as temp_output:
        output_dir = Path(temp_output)
        
        # Create expander with examples directory
        expander = CapabilityStatementExpander(
            str(examples_dir),
            str(output_dir),
            "dummy",
            verbose=False,
            clean_output=False
        )
        expander.load_all_resources()
        
        print(f"📊 Loaded {len(expander.all_resources)} resources from examples/")
        
        # Test 1: Exact canonical URL matching
        print("\n🔍 Test 4.1: Exact canonical URL matching")
        result = expander.find_resource_by_reference(
            "http://hl7.org/fhir/StructureDefinition/Bundle"
        )
        if result and result['resource']['id'] == "Bundle":
            print("  ✅ Found Bundle via canonical URL")
        else:
            print("  ❌ Failed to find Bundle")
            return False
        
        # Test 2: False positive prevention (Bundle vs ISiKBerichtBundle)
        print("\n🔍 Test 4.2: False positive prevention")
        result = expander.find_resource_by_reference(
            "http://hl7.org/fhir/StructureDefinition/Bundle"
        )
        if result and result['resource']['id'] == "Bundle" and result['resource']['id'] != "ISiKBerichtBundle":
            print("  ✅ Bundle URL does not match ISiKBerichtBundle")
        else:
            print("  ❌ False positive detected")
            return False
        
        # Test 3: Scheme exact matching (http vs https)
        print("\n🔍 Test 4.3: Scheme exact matching (http vs https)")
        result = expander.find_resource_by_reference(
            "https://example.org/fhir/StructureDefinition/PatientProfile"  # https
        )
        if result is None:
            print("  ✅ https:// does not match http:// resource")
        else:
            print("  ❌ Scheme should not match")
            return False
        
        result = expander.find_resource_by_reference(
            "http://example.org/fhir/StructureDefinition/PatientProfile"  # http
        )
        if result is not None:
            print("  ✅ Exact http:// scheme match works")
        else:
            print("  ❌ Exact scheme match failed")
            return False
        
        # Test 4: Version validation
        print("\n🔍 Test 4.4: Version validation")
        result = expander.find_resource_by_reference(
            "http://example.org/fhir/StructureDefinition/PatientProfileV1|1.0.0"
        )
        if result is not None:
            print("  ✅ Correct version found")
        else:
            print("  ❌ Version matching failed")
            return False
        
        result = expander.find_resource_by_reference(
            "http://example.org/fhir/StructureDefinition/PatientProfileV1|2.0.0"
        )
        if result is None:
            print("  ✅ Wrong version correctly rejected")
        else:
            print("  ❌ Wrong version should not match")
            return False
        
        # Test 5: Simple IDs should NOT work (require ResourceType)
        print("\n🔍 Test 4.5: Simple IDs require ResourceType")
        result = expander.find_resource_by_reference("patient-123")
        if result is None:
            print("  ✅ Simple ID correctly rejected (requires ResourceType/ID format)")
        else:
            print("  ❌ Simple ID should not match (missing ResourceType)")
            return False
        
        result = expander.find_resource_by_reference("Patient/patient-123")
        if result and result['resource']['id'] == "patient-123":
            print("  ✅ FHIR reference with ResourceType works correctly")
        else:
            print("  ❌ FHIR reference failed")
            return False
        
        # Test 6: FHIR relative reference
        print("\n🔍 Test 4.6: FHIR relative reference (ResourceType/ID)")
        result = expander.find_resource_by_reference("Patient/patient-123")
        if result and result['resource']['resourceType'] == "Patient" and result['resource']['id'] == "patient-123":
            print("  ✅ Relative FHIR reference works")
        else:
            print("  ❌ Relative reference failed")
            return False
        
        # Test 7: FHIR absolute reference
        print("\n🔍 Test 4.7: FHIR absolute reference (http://base/ResourceType/ID)")
        result = expander.find_resource_by_reference(
            "http://example.org/fhir/Patient/patient-123"
        )
        if result and result['resource']['id'] == "patient-123":
            print("  ✅ Absolute FHIR reference works")
        else:
            print("  ❌ Absolute reference failed")
            return False
        
        # Test 8: ResourceType mismatch
        print("\n🔍 Test 4.8: ResourceType validation")
        result = expander.find_resource_by_reference("Patient/patient-123")
        if result is not None:
            print("  ✅ Patient/patient-123 found")
        else:
            print("  ❌ Should find Patient/patient-123")
            return False
        
        result = expander.find_resource_by_reference("Observation/patient-123")
        if result is None:
            print("  ✅ Observation/patient-123 correctly rejected (wrong type)")
        else:
            print("  ❌ ResourceType mismatch should fail")
            return False
        
        # Test 9: Non-existent resources
        print("\n🔍 Test 4.9: Non-existent resources")
        result = expander.find_resource_by_reference("http://example.org/nonexistent")
        if result is None:
            print("  ✅ Non-existent URL returns None")
        else:
            print("  ❌ Should not find non-existent resource")
            return False
        
        result = expander.find_resource_by_reference("Patient/nonexistent")
        if result is None:
            print("  ✅ Non-existent FHIR reference returns None")
        else:
            print("  ❌ Should not find non-existent resource")
            return False
        
        print("\n✅ TEST 4 PASSED: All reference matching strategies work correctly")
        return True

def _make_cs(cs_id: str, url: str, profile_url: str = None, imports: list = None, import_expectations: list = None) -> dict:
    """Helper: build a minimal CapabilityStatement dict for filter tests"""
    cs = {
        "resourceType": "CapabilityStatement",
        "id": cs_id,
        "url": url,
        "status": "active",
        "kind": "requirements",
        "fhirVersion": "4.0.1",
        "format": ["application/fhir+json"],
    }
    if imports:
        cs["imports"] = imports
        if import_expectations:
            cs["_imports"] = [
                {
                    "extension": [{
                        "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                        "valueCode": exp
                    }]
                } if exp else {}
                for exp in import_expectations
            ]
    if profile_url:
        cs["rest"] = [{
            "mode": "server",
            "resource": [{
                "type": "Patient",
                "supportedProfile": [profile_url]
            }]
        }]
    return cs


def test_expectation_filter_shall():
    """--expectation-filter SHALL: only SHALL imports are processed; SHOULD/MAY are skipped"""
    print("\n" + "=" * 70)
    print("TEST 5: Expectation Filter -- SHALL only")
    print("=" * 70)
    print("Setup:")
    print("  - base CS imports 'should-cs' (SHOULD) and 'shall-cs' (SHALL)")
    print("  - should-cs contributes ProfileShould")
    print("  - shall-cs contributes ProfileShall")
    print("  - Filter: SHALL → only ProfileShall expected in output")

    base_url  = "http://test.example/CapabilityStatement/base"
    shall_url = "http://test.example/CapabilityStatement/shall-cs"
    should_url= "http://test.example/CapabilityStatement/should-cs"

    base_cs   = _make_cs("base",     base_url,
                         imports=[shall_url, should_url],
                         import_expectations=["SHALL", "SHOULD"])
    shall_cs  = _make_cs("shall-cs", shall_url,
                         profile_url="http://test.example/StructureDefinition/ProfileShall")
    should_cs = _make_cs("should-cs",should_url,
                         profile_url="http://test.example/StructureDefinition/ProfileShould")

    with tempfile.TemporaryDirectory() as input_dir, tempfile.TemporaryDirectory() as output_dir:
        input_path  = Path(input_dir)
        output_path = Path(output_dir)

        for cs in [base_cs, shall_cs, should_cs]:
            (input_path / f"CapabilityStatement-{cs['id']}.json").write_text(json.dumps(cs, indent=2))

        expander = CapabilityStatementExpander(
            str(input_path), str(output_path),
            [base_url], verbose=False, clean_output=True,
            expectation_filter="SHALL"
        )
        expander.run()

        expanded_file = output_path / "CapabilityStatement-base-expanded.json"
        if not expanded_file.exists():
            print("❌ Expanded file not found!")
            return False

        with open(expanded_file) as f:
            expanded = json.load(f)

        all_profiles = []
        for rest_entry in expanded.get("rest", []):
            for res in rest_entry.get("resource", []):
                all_profiles.extend(res.get("supportedProfile", []))

        print(f"\nProfiles in expanded CS: {all_profiles}")

        if "http://test.example/StructureDefinition/ProfileShall" not in all_profiles:
            print("❌ ProfileShall missing — SHALL import was not processed!")
            return False

        if "http://test.example/StructureDefinition/ProfileShould" in all_profiles:
            print("❌ ProfileShould present — SHOULD import was NOT filtered!")
            return False

        print("✅ TEST 5 PASSED: SHALL filter correctly includes SHALL, skips SHOULD")
        return True


def test_expectation_filter_should():
    """--expectation-filter SHOULD: SHALL + SHOULD processed; MAY skipped"""
    print("\n" + "=" * 70)
    print("TEST 6: Expectation Filter -- SHOULD (SHALL + SHOULD, skip MAY)")
    print("=" * 70)
    print("Setup:")
    print("  - base CS imports 'shall-cs' (SHALL), 'should-cs' (SHOULD), 'may-cs' (MAY)")
    print("  - Filter: SHOULD → ProfileShall + ProfileShould expected, ProfileMay NOT")

    base_url   = "http://test.example/CapabilityStatement/base2"
    shall_url  = "http://test.example/CapabilityStatement/shall-cs2"
    should_url = "http://test.example/CapabilityStatement/should-cs2"
    may_url    = "http://test.example/CapabilityStatement/may-cs2"

    base_cs   = _make_cs("base2",     base_url,
                         imports=[shall_url, should_url, may_url],
                         import_expectations=["SHALL", "SHOULD", "MAY"])
    shall_cs  = _make_cs("shall-cs2", shall_url,
                         profile_url="http://test.example/StructureDefinition/ProfileShall2")
    should_cs = _make_cs("should-cs2",should_url,
                         profile_url="http://test.example/StructureDefinition/ProfileShould2")
    may_cs    = _make_cs("may-cs2",   may_url,
                         profile_url="http://test.example/StructureDefinition/ProfileMay2")

    with tempfile.TemporaryDirectory() as input_dir, tempfile.TemporaryDirectory() as output_dir:
        input_path  = Path(input_dir)
        output_path = Path(output_dir)

        for cs in [base_cs, shall_cs, should_cs, may_cs]:
            (input_path / f"CapabilityStatement-{cs['id']}.json").write_text(json.dumps(cs, indent=2))

        expander = CapabilityStatementExpander(
            str(input_path), str(output_path),
            [base_url], verbose=False, clean_output=True,
            expectation_filter="SHOULD"
        )
        expander.run()

        expanded_file = output_path / "CapabilityStatement-base2-expanded.json"
        if not expanded_file.exists():
            print("❌ Expanded file not found!")
            return False

        with open(expanded_file) as f:
            expanded = json.load(f)

        all_profiles = []
        for rest_entry in expanded.get("rest", []):
            for res in rest_entry.get("resource", []):
                all_profiles.extend(res.get("supportedProfile", []))

        print(f"\nProfiles in expanded CS: {all_profiles}")

        if "http://test.example/StructureDefinition/ProfileShall2" not in all_profiles:
            print("❌ ProfileShall2 missing — SHALL import was not processed!")
            return False
        if "http://test.example/StructureDefinition/ProfileShould2" not in all_profiles:
            print("❌ ProfileShould2 missing — SHOULD import was not processed!")
            return False
        if "http://test.example/StructureDefinition/ProfileMay2" in all_profiles:
            print("❌ ProfileMay2 present — MAY import was NOT filtered!")
            return False

        print("✅ TEST 6 PASSED: SHOULD filter correctly includes SHALL+SHOULD, skips MAY")
        return True


def test_expectation_filter_no_premature_processed_marking():
    """
    Regression test for the bug fixed in this PR:
    A filtered-out import must NOT be added to processed_imports,
    so that if the same URL appears again at a stronger expectation level
    (e.g. in a sibling or parent CS), it is still processed correctly.
    """
    print("\n" + "=" * 70)
    print("TEST 7: Regression – filtered import not prematurely marked as processed")
    print("=" * 70)
    print("Setup:")
    print("  - A imports B (MAY) and C (SHALL)")
    print("  - C also imports B (SHALL)")
    print("  - Filter: SHALL → B's profile should appear (via C's SHALL import)")

    base_url = "http://test.example/CapabilityStatement/reg-base"
    b_url    = "http://test.example/CapabilityStatement/reg-b"
    c_url    = "http://test.example/CapabilityStatement/reg-c"

    # A: imports B with MAY *and* C with SHALL
    a_cs = _make_cs("reg-base", base_url,
                    imports=[b_url, c_url],
                    import_expectations=["MAY", "SHALL"])
    # B: contributes ProfileB
    b_cs = _make_cs("reg-b", b_url,
                    profile_url="http://test.example/StructureDefinition/ProfileB")
    # C: imports B with SHALL — this is the path that should survive the filter
    c_cs = _make_cs("reg-c", c_url,
                    imports=[b_url],
                    import_expectations=["SHALL"])
    # Give C its own profile too
    c_cs["rest"] = [{
        "mode": "server",
        "resource": [{
            "type": "Patient",
            "supportedProfile": [
                "http://test.example/StructureDefinition/ProfileC",
                "http://test.example/StructureDefinition/ProfileB",
            ]
        }]
    }]

    with tempfile.TemporaryDirectory() as input_dir, tempfile.TemporaryDirectory() as output_dir:
        input_path  = Path(input_dir)
        output_path = Path(output_dir)

        for cs in [a_cs, b_cs, c_cs]:
            (input_path / f"CapabilityStatement-{cs['id']}.json").write_text(json.dumps(cs, indent=2))

        expander = CapabilityStatementExpander(
            str(input_path), str(output_path),
            [base_url], verbose=False, clean_output=True,
            expectation_filter="SHALL"
        )
        expander.run()

        expanded_file = output_path / "CapabilityStatement-reg-base-expanded.json"
        if not expanded_file.exists():
            print("❌ Expanded file not found!")
            return False

        with open(expanded_file) as f:
            expanded = json.load(f)

        all_profiles = []
        for rest_entry in expanded.get("rest", []):
            for res in rest_entry.get("resource", []):
                all_profiles.extend(res.get("supportedProfile", []))

        print(f"\nProfiles in expanded CS: {all_profiles}")

        if "http://test.example/StructureDefinition/ProfileC" not in all_profiles:
            print("❌ ProfileC missing — SHALL import of C was not processed!")
            return False

        if "http://test.example/StructureDefinition/ProfileB" not in all_profiles:
            print("❌ ProfileB missing — B was prematurely blocked by the MAY import path!")
            return False

        print("✅ TEST 7 PASSED: filtered import not prematurely marked as processed")
        return True


def test_filter_respected_for_supported_profile_expectations():
    """
    Regression test: within a SHALL-imported CS, supportedProfile entries that
    carry a _supportedProfile expectation of MAY must be excluded when the filter
    is SHOULD.  Previously, collect_referenced_resources ignored per-element
    expectations entirely.
    """
    print("\n" + "=" * 70)
    print("TEST 8: Per-element supportedProfile expectation respected by filter")
    print("=" * 70)
    print("Setup:")
    print("  - base CS imports 'detail-cs' (SHALL)")
    print("  - detail-cs has ProfileShall (SHALL) and ProfileMay (MAY) in supportedProfile")
    print("  - Filter: SHOULD → ProfileShall expected, ProfileMay NOT")

    base_url   = "http://test.example/CapabilityStatement/sp-base"
    detail_url = "http://test.example/CapabilityStatement/sp-detail"

    base_cs = _make_cs("sp-base", base_url,
                       imports=[detail_url],
                       import_expectations=["SHALL"])

    # detail-cs defines both a SHALL and a MAY supportedProfile on the same resource type
    detail_cs = {
        "resourceType": "CapabilityStatement",
        "id": "sp-detail",
        "url": detail_url,
        "status": "active",
        "kind": "requirements",
        "fhirVersion": "4.0.1",
        "format": ["application/fhir+json"],
        "rest": [{
            "mode": "server",
            "resource": [{
                "type": "Patient",
                "supportedProfile": [
                    "http://test.example/StructureDefinition/ProfileShallInline",
                    "http://test.example/StructureDefinition/ProfileMayInline",
                ],
                "_supportedProfile": [
                    {
                        "extension": [{
                            "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                            "valueCode": "SHALL"
                        }]
                    },
                    {
                        "extension": [{
                            "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                            "valueCode": "MAY"
                        }]
                    }
                ]
            }]
        }]
    }

    with tempfile.TemporaryDirectory() as input_dir, tempfile.TemporaryDirectory() as output_dir:
        input_path  = Path(input_dir)
        output_path = Path(output_dir)

        for cs in [base_cs, detail_cs]:
            (input_path / f"CapabilityStatement-{cs['id']}.json").write_text(json.dumps(cs, indent=2))

        expander = CapabilityStatementExpander(
            str(input_path), str(output_path),
            [base_url], verbose=False, clean_output=True,
            expectation_filter="SHOULD"
        )
        expander.run()

        print(f"\nReferenced resources collected: {sorted(expander.referenced_resources)}")

        if "http://test.example/StructureDefinition/ProfileShallInline" not in expander.referenced_resources:
            print("❌ ProfileShallInline missing — SHALL profile was filtered out incorrectly!")
            return False

        if "http://test.example/StructureDefinition/ProfileMayInline" in expander.referenced_resources:
            print("❌ ProfileMayInline present — MAY profile was NOT filtered from supportedProfile!")
            return False

        print("✅ TEST 8 PASSED: per-element supportedProfile expectation respected by filter")
        return True


def test_filter_transitive_imports_blocked():
    """
    When A imports B with MAY (filtered out), B must be skipped entirely —
    including B's own transitive imports (e.g. B imports C with SHALL).
    C must NOT appear in the output if the path to it runs through a filtered import.
    """
    print("\n" + "=" * 70)
    print("TEST 9: Transitive imports blocked when parent import is filtered")
    print("=" * 70)
    print("Setup:")
    print("  - A imports B (MAY)")
    print("  - B imports C (SHALL)")
    print("  - Filter: SHOULD → B skipped, C must also NOT appear")

    a_url = "http://test.example/CapabilityStatement/trans-a"
    b_url = "http://test.example/CapabilityStatement/trans-b"
    c_url = "http://test.example/CapabilityStatement/trans-c"

    a_cs = _make_cs("trans-a", a_url,
                    imports=[b_url],
                    import_expectations=["MAY"])
    b_cs = _make_cs("trans-b", b_url,
                    imports=[c_url],
                    import_expectations=["SHALL"],
                    profile_url="http://test.example/StructureDefinition/ProfileB")
    c_cs = _make_cs("trans-c", c_url,
                    profile_url="http://test.example/StructureDefinition/ProfileC")

    with tempfile.TemporaryDirectory() as input_dir, tempfile.TemporaryDirectory() as output_dir:
        input_path  = Path(input_dir)
        output_path = Path(output_dir)

        for cs in [a_cs, b_cs, c_cs]:
            (input_path / f"CapabilityStatement-{cs['id']}.json").write_text(json.dumps(cs, indent=2))

        expander = CapabilityStatementExpander(
            str(input_path), str(output_path),
            [a_url], verbose=False, clean_output=True,
            expectation_filter="SHOULD"
        )
        expander.run()

        expanded_file = output_path / "CapabilityStatement-trans-a-expanded.json"
        if not expanded_file.exists():
            print("❌ Expanded file not found!")
            return False

        with open(expanded_file) as f:
            expanded = json.load(f)

        all_profiles = []
        for rest_entry in expanded.get("rest", []):
            for res in rest_entry.get("resource", []):
                all_profiles.extend(res.get("supportedProfile", []))

        print(f"\nProfiles in expanded CS: {all_profiles}")
        print(f"Referenced resources: {sorted(expander.referenced_resources)}")

        if "http://test.example/StructureDefinition/ProfileB" in all_profiles:
            print("❌ ProfileB present — B (MAY import) was NOT filtered!")
            return False

        if "http://test.example/StructureDefinition/ProfileC" in all_profiles:
            print("❌ ProfileC present — C was reachable via filtered B (should be blocked)!")
            return False

        print("✅ TEST 9 PASSED: transitive imports correctly blocked when parent is filtered")
        return True


def main():
    """Main test runner"""
    print("=" * 70)
    print("FHIR CapabilityStatement Expander - Test Suite")
    print("=" * 70)
    
    # Run all tests
    tests = [
        ("Basic Expansion", test_basic_expansion),
        ("Expectation Upgrade", test_expectation_upgrade),
        ("Multi-Level Expectation", test_multi_level_expectation),
        ("Reference Matching", test_reference_matching),
        ("Filter: SHALL only", test_expectation_filter_shall),
        ("Filter: SHOULD (SHALL+SHOULD)", test_expectation_filter_should),
        ("Filter: no premature processed-marking", test_expectation_filter_no_premature_processed_marking),
        ("Filter: per-element supportedProfile expectation", test_filter_respected_for_supported_profile_expectations),
        ("Filter: transitive imports blocked", test_filter_transitive_imports_blocked),
    ]
    
    results = []
    for test_name, test_func in tests:
        try:
            success = test_func()
            results.append((test_name, success))
        except Exception as e:
            print(f"\n❌ Test '{test_name}' crashed: {e}")
            import traceback
            traceback.print_exc()
            results.append((test_name, False))
    
    # Print summary
    print("\n" + "=" * 70)
    print("TEST SUMMARY")
    print("=" * 70)
    
    passed = sum(1 for _, success in results if success)
    total = len(results)
    
    for test_name, success in results:
        status = "✅ PASSED" if success else "❌ FAILED"
        print(f"{status}: {test_name}")
    
    print("=" * 70)
    print(f"Results: {passed}/{total} tests passed")
    
    if passed == total:
        print("✅ All tests completed successfully!")
        sys.exit(0)
    else:
        print(f"❌ {total - passed} test(s) failed!")
        sys.exit(1)

if __name__ == "__main__":
    main()