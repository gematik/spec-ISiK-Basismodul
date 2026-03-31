'use strict';

const fs = require('fs');
const path = require('path');

function walk(dir, results = []) {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      walk(fullPath, results);
    } else if (entry.isFile() && fullPath.endsWith('.fsh')) {
      results.push(fullPath);
    }
  }
  return results;
}

const files = walk('Resources');
const changes = [];
const alreadyActive = [];

for (const file of files) {
  const original = fs.readFileSync(file, 'utf8');
  const lines = original.split(/\r?\n/);
  const updatedLines = [];
  const uncommented = [];
  const existingActive = [];

  for (const line of lines) {
    const commentedMatch = line.match(/^(\s*)\/\/ \* insert CompliesWith\((.+)\)$/);
    const activeMatch = line.match(/^(\s*)\* insert CompliesWith\((.+)\)$/);

    if (commentedMatch) {
      updatedLines.push(`${commentedMatch[1]}* insert CompliesWith(${commentedMatch[2]})`);
      uncommented.push(commentedMatch[2]);
    } else if (activeMatch) {
      updatedLines.push(line);
      existingActive.push(activeMatch[2]);
    } else {
      updatedLines.push(line);
    }
  }

  if (uncommented.length > 0) {
    const newline = original.includes('\r\n') ? '\r\n' : '\n';
    fs.writeFileSync(file, updatedLines.join(newline));
    changes.push({ file, uncommented });
  }

  if (existingActive.length > 0) {
    alreadyActive.push({ file, uncommented: existingActive });
  }
}

if (changes.length > 0) {
  console.log('Uncommented CompliesWith inserts:');
  for (const change of changes) {
    console.log(`- ${change.file}`);
    for (const canonical of change.uncommented) {
      console.log(`  - ${canonical}`);
    }
  }
} else {
  console.log('No commented CompliesWith inserts found to uncomment.');
}

if (alreadyActive.length > 0) {
  console.log('Already active CompliesWith inserts after this step:');
  for (const change of alreadyActive) {
    console.log(`- ${change.file}`);
    for (const canonical of change.uncommented) {
      console.log(`  - ${canonical}`);
    }
  }
} else {
  console.log('No active CompliesWith inserts present after this step.');
}
