#!/usr/bin/env node
/*
 * Generates a publication-request.json for a single IG and writes it into the
 * IG output directory.
 *
 * The publication-request.json is the input file consumed by the official HL7
 * FHIR publication ("go-publish") process. The IG Publisher never produces it
 * itself, so this script derives it generically per IG from the SUSHI-generated
 * ImplementationGuide resource and drops it next to the rendered IG output.
 *
 * Usage:
 *   node scripts/publication-request/generate.js --ig-dir publisher-guides/Basis
 *   node scripts/publication-request/generate.js --ig-dir publisher-guides/Basis \
 *     --out publisher-guides/Basis/output/publication-request.json \
 *     --config scripts/publication-request/config.json
 *
 * Options:
 *   --ig-dir <dir>   IG directory under publisher-guides (required)
 *   --ig <file>      Explicit path to an ImplementationGuide-*.json (overrides auto-detect)
 *   --out <file>     Output path (default: <ig-dir>/output/publication-request.json)
 *   --config <file>  Per-IG override config (default: scripts/publication-request/config.json)
 *   --dry-run        Print the result to stdout instead of writing a file
 */

'use strict';

const fs = require('fs');
const path = require('path');

// ---------------------------------------------------------------------------
// Argument parsing
// ---------------------------------------------------------------------------

function parseArgs(argv) {
  const args = { dryRun: false };
  for (let i = 2; i < argv.length; i++) {
    const a = argv[i];
    switch (a) {
      case '--ig-dir':
        args.igDir = argv[++i];
        break;
      case '--ig':
        args.igFile = argv[++i];
        break;
      case '--out':
        args.out = argv[++i];
        break;
      case '--config':
        args.config = argv[++i];
        break;
      case '--dry-run':
        args.dryRun = true;
        break;
      default:
        throw new Error(`Unknown argument: ${a}`);
    }
  }
  if (!args.igDir && !args.igFile) {
    throw new Error('Either --ig-dir or --ig is required.');
  }
  return args;
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

// Locate the SUSHI-generated ImplementationGuide resource for an IG directory.
function findImplementationGuide(igDir) {
  const resourcesDir = path.join(igDir, 'fsh-generated', 'resources');
  if (!fs.existsSync(resourcesDir)) {
    throw new Error(
      `fsh-generated resources not found: ${resourcesDir}\n` +
        'Run SUSHI for this IG before generating the publication request.'
    );
  }
  const candidates = fs
    .readdirSync(resourcesDir)
    .filter((f) => /^ImplementationGuide-.*\.json$/i.test(f));
  if (candidates.length === 0) {
    throw new Error(`No ImplementationGuide-*.json found in ${resourcesDir}`);
  }
  if (candidates.length > 1) {
    console.warn(
      `WARN: multiple ImplementationGuide resources found, using "${candidates[0]}": ${candidates.join(', ')}`
    );
  }
  return path.join(resourcesDir, candidates[0]);
}

// canonical = ImplementationGuide.url without the trailing /ImplementationGuide/<id>.
// Trailing slashes are trimmed so a misconfigured canonical (e.g. ".../isik/")
// does not produce a double slash in the composed path.
function deriveCanonical(ig) {
  if (typeof ig.url === 'string' && ig.url.length > 0) {
    return ig.url.replace(/\/ImplementationGuide\/[^/]+$/, '').replace(/\/+$/, '');
  }
  throw new Error('ImplementationGuide.url is missing; cannot derive canonical base.');
}

// A version is a pre-release if it carries a semver pre-release suffix (e.g. 6.0.0-rc1).
function isPreRelease(version) {
  return typeof version === 'string' && version.includes('-');
}

// Major component of a (possibly pre-release) semver version: "6.0.0-rc1" -> "6"
function majorOf(version) {
  return String(version).split('.')[0].split('-')[0];
}

// mode: pre-release -> working, otherwise milestone (decision: derive from version/releaseLabel)
function deriveMode(version) {
  return isPreRelease(version) ? 'working' : 'milestone';
}

// status: map ImplementationGuide.status onto the publication maturity (decision: derive from IG.status)
const STATUS_MAP = {
  draft: 'draft',
  active: 'trial-use',
  retired: 'retired',
};
function deriveStatus(igStatus) {
  return STATUS_MAP[igStatus] || igStatus || 'draft';
}

// Load per-IG overrides. Config is keyed by package-id or by IG id; both are checked.
function loadOverrides(configPath, ig) {
  if (!configPath || !fs.existsSync(configPath)) {
    return {};
  }
  const cfg = JSON.parse(fs.readFileSync(configPath, 'utf8'));
  const byId = (cfg.overrides && (cfg.overrides[ig.packageId] || cfg.overrides[ig.id])) || {};
  return byId;
}

// ---------------------------------------------------------------------------
// Core
// ---------------------------------------------------------------------------

function buildPublicationRequest(ig, overrides) {
  const canonical = overrides.canonical || deriveCanonical(ig);
  const packageId = overrides['package-id'] || ig.packageId;
  const version = overrides.version || ig.version;

  if (!packageId) throw new Error('ImplementationGuide.packageId is missing.');
  if (!version) throw new Error('ImplementationGuide.version is missing.');

  const sequence = overrides.sequence || `Stufe ${majorOf(version)}`;
  const mode = overrides.mode || deriveMode(version);
  const status = overrides.status || deriveStatus(ig.status);
  const path_ = overrides.path || `${canonical}/${packageId}/${version}`;

  const title = ig.title || ig.name || packageId;
  const defaultDesc = `${title}, Version ${version} (${sequence}).`;
  const descmd = overrides.descmd || overrides.desc || defaultDesc;
  const desc = overrides.desc || overrides.descmd || defaultDesc;
  const changes = overrides.changes || 'changes.html';

  // Field order mirrors the HL7 reference (e.g. US Core) publication-request.json.
  return {
    'package-id': packageId,
    version,
    path: path_,
    mode,
    status,
    sequence,
    descmd,
    desc,
    changes,
  };
}

function main() {
  const args = parseArgs(process.argv);

  const igFile = args.igFile || findImplementationGuide(args.igDir);
  if (!fs.existsSync(igFile)) {
    throw new Error(`ImplementationGuide file not found: ${igFile}`);
  }
  const ig = JSON.parse(fs.readFileSync(igFile, 'utf8'));

  const configPath =
    args.config || path.join(__dirname, 'config.json');
  const overrides = loadOverrides(configPath, ig);

  const pubRequest = buildPublicationRequest(ig, overrides);
  const json = JSON.stringify(pubRequest, null, 4) + '\n';

  if (args.dryRun) {
    process.stdout.write(json);
    return;
  }

  const outPath =
    args.out ||
    path.join(args.igDir || path.dirname(path.dirname(path.dirname(igFile))), 'output', 'publication-request.json');

  fs.mkdirSync(path.dirname(outPath), { recursive: true });
  fs.writeFileSync(outPath, json, 'utf8');
  console.log(`publication-request.json written: ${outPath}`);
  console.log(`  package-id: ${pubRequest['package-id']}`);
  console.log(`  version:    ${pubRequest.version}`);
  console.log(`  path:       ${pubRequest.path}`);
  console.log(`  mode:       ${pubRequest.mode}`);
  console.log(`  status:     ${pubRequest.status}`);
  console.log(`  sequence:   ${pubRequest.sequence}`);
}

try {
  main();
} catch (err) {
  console.error(`ERROR: ${err.message}`);
  process.exit(1);
}
