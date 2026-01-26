'use strict';

const fs = require('fs');
const path = require('path');

module.exports = async function run({ github, context, core, branch }) {
  const { owner, repo } = context.repo;
  const targetBranch = branch || process.env.BRANCH_NAME;
  const marker = '<!-- ig-publish-urls-all -->';

  const igUrls = [];
  const igUrlsDir = 'ig-urls';

  try {
    if (fs.existsSync(igUrlsDir)) {
      const artifacts = fs.readdirSync(igUrlsDir);
      for (const artifact of artifacts) {
        const urlFile = path.join(igUrlsDir, artifact, 'urls.txt');
        if (fs.existsSync(urlFile)) {
          const content = fs.readFileSync(urlFile, 'utf8');
          const lines = content.trim().split('\n');
          for (const line of lines) {
            const [igName, url] = line.split('|');
            if (igName && url) {
              igUrls.push({ name: igName.trim(), url: url.trim() });
            }
          }
        }
      }
    }
  } catch (error) {
    core.warning(`Failed to read IG URLs: ${error.message}`);
  }

  if (igUrls.length === 0) {
    core.info('No IG URLs found - skipping PR comment');
    return;
  }

  let body = `${marker}\n### 🚀 Published Implementation Guides\n\n`;
  body += `Branch: \`${targetBranch}\`\n\n`;

  const publishedIGs = igUrls.filter((ig) => ig.url !== 'NO_CHANGES');
  const unchangedIGs = igUrls.filter((ig) => ig.url === 'NO_CHANGES');

  if (publishedIGs.length > 0) {
    body += '#### ✅ Published IGs:\n\n';
    for (const ig of publishedIGs) {
      body += `- **${ig.name}**: [View Published IG](${ig.url})\n`;
    }
    body += '\n_These IGs are available at the URLs above (last build may have been from a previous commit)._\n';
  }

  if (unchangedIGs.length > 0) {
    body += '\n#### ℹ️ Not yet published:\n\n';
    for (const ig of unchangedIGs) {
      body += `- **${ig.name}**: No changes detected - build skipped\n`;
    }
    body += '\n_Note: Use "Force build" option in workflow dispatch to build these IGs._\n';
  }

  const { data: prs } = await github.rest.pulls.list({
    owner,
    repo,
    state: 'open',
    per_page: 100,
  });
  const pr = prs.find((p) => p.head && p.head.ref === targetBranch);

  if (!pr) {
    core.info(`No open PR found for branch ${targetBranch}; skipping PR comment.`);
    return;
  }

  const { data: comments } = await github.rest.issues.listComments({
    owner,
    repo,
    issue_number: pr.number,
    per_page: 100,
  });

  const existingComments = comments.filter(
    (c) => typeof c.body === 'string' && c.body.includes(marker)
  );

  for (const existing of existingComments) {
    await github.rest.issues.deleteComment({
      owner,
      repo,
      comment_id: existing.id,
    });
    core.info(`Deleted old PR comment #${existing.id} on PR #${pr.number}`);
  }

  await github.rest.issues.createComment({
    owner,
    repo,
    issue_number: pr.number,
    body,
  });
  core.info(
    `Created new PR comment with ${publishedIGs.length} published and ${unchangedIGs.length} skipped IG(s) on PR #${pr.number}`
  );
};
