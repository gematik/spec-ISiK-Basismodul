'use strict';

const fs = require('fs');
const path = require('path');

function collectUrlFiles(igUrlsDir) {
  const urlFiles = [];

  if (!fs.existsSync(igUrlsDir)) {
    return urlFiles;
  }

  const directUrlFile = path.join(igUrlsDir, 'urls.txt');
  if (fs.existsSync(directUrlFile)) {
    urlFiles.push(directUrlFile);
  }

  const artifacts = fs.readdirSync(igUrlsDir);
  for (const artifact of artifacts) {
    const urlFile = path.join(igUrlsDir, artifact, 'urls.txt');
    if (fs.existsSync(urlFile)) {
      urlFiles.push(urlFile);
    }
  }

  return urlFiles;
}

function readIgUrls(urlFiles) {
  const igUrls = [];

  for (const urlFile of urlFiles) {
    const content = fs.readFileSync(urlFile, 'utf8');
    const lines = content.split('\n');
    for (const line of lines) {
      if (!line.trim()) {
        continue;
      }
      const [igName, url] = line.split('|');
      if (igName && url) {
        igUrls.push({ name: igName.trim(), url: url.trim() });
      }
    }
  }

  return igUrls;
}

function buildSummary({ branch, igUrls }) {
  const publishedIGs = igUrls.filter((ig) => ig.url !== 'NO_CHANGES');
  const unchangedIGs = igUrls.filter((ig) => ig.url === 'NO_CHANGES');

  let summary = '## Published Implementation Guides\n';

  if (branch) {
    summary += `Branch: \`${branch}\`\n\n`;
  }

  if (publishedIGs.length > 0) {
    summary += '### Published IGs\n';
    for (const ig of publishedIGs) {
      summary += `- **${ig.name}**: ${ig.url}\n`;
    }
    summary += '\n';
  }

  if (unchangedIGs.length > 0) {
    summary += '### Not yet published\n';
    for (const ig of unchangedIGs) {
      summary += `- **${ig.name}**: No changes detected - build skipped\n`;
    }
    summary += '\n';
  }

  return summary;
}

const summaryPath = process.env.GITHUB_STEP_SUMMARY;
if (!summaryPath) {
  console.log('GITHUB_STEP_SUMMARY not set - skipping summary output.');
  process.exit(0);
}

const igUrlsDir = process.env.IG_URLS_DIR || 'ig-urls';
const urlFiles = collectUrlFiles(igUrlsDir);
const igUrls = readIgUrls(urlFiles);

if (igUrls.length === 0) {
  console.log('No IG URLs found - skipping summary output.');
  process.exit(0);
}

const branch =
  process.env.BRANCH_NAME || process.env.GITHUB_HEAD_REF || process.env.GITHUB_REF_NAME;

const summary = buildSummary({ branch, igUrls });
fs.appendFileSync(summaryPath, summary);
console.log('Wrote IG URL summary.');
