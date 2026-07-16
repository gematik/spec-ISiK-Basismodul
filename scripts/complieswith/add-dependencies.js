'use strict';

const fs = require('fs');

const config = (process.env.COMPLIESWITH_DEPENDENCIES || '')
  .split('\n')
  .map((line) => line.trim())
  .filter((line) => line && !line.startsWith('#'));

if (config.length === 0) {
  console.log('No CompliesWith dependencies configured.');
  process.exit(0);
}

const entries = config.map((line) => {
  const idx = line.lastIndexOf('#');
  if (idx <= 0 || idx === line.length - 1) {
    throw new Error(`Invalid dependency entry "${line}". Expected Package#version.`);
  }
  return [line.slice(0, idx), line.slice(idx + 1)];
});

const packageJsonPath = 'package.json';
const packageJson = JSON.parse(fs.readFileSync(packageJsonPath, 'utf8'));
packageJson.dependencies ??= {};
packageJson.devDependencies ??= {};
const packageChanges = [];
for (const [pkg, version] of entries) {
  const previousDependency = packageJson.dependencies[pkg];
  const previousDevDependency = packageJson.devDependencies[pkg];
  delete packageJson.dependencies[pkg];
  packageJson.devDependencies[pkg] = version;

  const actions = [];
  if (previousDependency !== undefined) {
    actions.push(`removed dependencies=${previousDependency}`);
  }
  if (previousDevDependency === undefined) {
    actions.push(`added devDependencies=${version}`);
  } else if (previousDevDependency !== version) {
    actions.push(`replaced devDependencies=${previousDevDependency} -> ${version}`);
  } else {
    actions.push(`kept devDependencies=${version}`);
  }
  packageChanges.push(`${pkg}: ${actions.join(', ')}`);
}
fs.writeFileSync(packageJsonPath, `${JSON.stringify(packageJson, null, 2)}\n`);

const sushiConfigPath = 'Resources/sushi-config.yaml';
const sushiConfigRaw = fs.readFileSync(sushiConfigPath, 'utf8').replace(/\r\n/g, '\n');
const dependenciesMatch = sushiConfigRaw.match(/(^dependencies:\n)((?:^[ \t]+.+\n?)*)/m);
if (!dependenciesMatch) {
  throw new Error('Could not find dependencies section in Resources/sushi-config.yaml.');
}

const existing = new Map();
for (const line of dependenciesMatch[2].split('\n')) {
  const match = line.match(/^[ \t]+([^:#]+):[ \t]*(.+)$/);
  if (match) {
    existing.set(match[1].trim(), match[2].trim());
  }
}
const sushiChanges = [];
for (const [pkg, version] of entries) {
  const previous = existing.get(pkg);
  existing.set(pkg, version);
  if (previous === undefined) {
    sushiChanges.push(`${pkg}: added dependencies=${version}`);
  } else if (previous !== version) {
    sushiChanges.push(`${pkg}: replaced dependencies=${previous} -> ${version}`);
  } else {
    sushiChanges.push(`${pkg}: kept dependencies=${version}`);
  }
}

const rebuiltDependencies = Array.from(existing.entries())
  .map(([pkg, version]) => `  ${pkg}: ${version}`)
  .join('\n');

const updatedSushiConfig =
  sushiConfigRaw.slice(0, dependenciesMatch.index) +
  dependenciesMatch[1] +
  rebuiltDependencies +
  '\n' +
  sushiConfigRaw.slice(dependenciesMatch.index + dependenciesMatch[0].length).replace(/^\n*/, '');

fs.writeFileSync(sushiConfigPath, updatedSushiConfig.replace(/\n/g, '\r\n'));

console.log('package.json devDependencies changes:');
for (const line of packageChanges) {
  console.log(`- ${line}`);
}
console.log('Resources/sushi-config.yaml dependency changes:');
for (const line of sushiChanges) {
  console.log(`- ${line}`);
}
