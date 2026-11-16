'use strict';

/**
 * Ermittelt den Referenzlauf (Baseline) für den Vergleich im PR-Kommentar
 * (PTDATA-2431). Läuft in actions/github-script.
 *
 * Referenz ist der jüngste abgeschlossene push-Lauf dieses Workflows auf dem
 * Base-Branch des PRs, der das Ergebnis-Artefakt besitzt. Die Conclusion des
 * Laufs ist unerheblich: Das Artefakt wird nur hochgeladen, wenn der Validator
 * ein auswertbares Ergebnis geliefert hat; Läufe mit Infrastrukturfehlern haben
 * kein Artefakt und werden übersprungen.
 *
 * Hinweis: Das ist der aktuelle Stand des Base-Branches, nicht der Merge-Base.
 *
 * Outputs: found, run_id, run_url, head_sha, created_at, artifact_id
 */

module.exports = async function run({ github, context, core }) {
  const { owner, repo } = context.repo;
  const baseRef = process.env.BASE_REF || '';
  const workflowFile = process.env.WORKFLOW_FILE || 'complieswith-export.yml';
  const artifactName = process.env.ARTIFACT_NAME || 'complieswith-export-validation-results';

  core.setOutput('found', 'false');
  if (!baseRef) {
    core.info('No base ref given; skipping baseline lookup.');
    return;
  }

  const { data } = await github.rest.actions.listWorkflowRuns({
    owner,
    repo,
    workflow_id: workflowFile,
    branch: baseRef,
    event: 'push',
    status: 'completed',
    per_page: 20,
  });
  const runs = Array.isArray(data.workflow_runs) ? data.workflow_runs : [];
  core.info(`Found ${runs.length} completed push run(s) of ${workflowFile} on ${baseRef}.`);

  for (const candidate of runs) {
    const { data: artifactData } = await github.rest.actions.listWorkflowRunArtifacts({
      owner,
      repo,
      run_id: candidate.id,
      per_page: 100,
    });
    const artifact = (artifactData.artifacts || []).find((item) => item.name === artifactName && !item.expired);
    if (!artifact) {
      core.info(`Run ${candidate.id} (${candidate.conclusion}) has no usable artifact "${artifactName}"; skipping.`);
      continue;
    }
    core.info(`Baseline: run ${candidate.id} (${candidate.conclusion}), commit ${candidate.head_sha}, artifact ${artifact.id}.`);
    core.setOutput('found', 'true');
    core.setOutput('run_id', String(candidate.id));
    core.setOutput('run_url', candidate.html_url);
    core.setOutput('head_sha', candidate.head_sha);
    core.setOutput('created_at', candidate.run_started_at || candidate.created_at);
    core.setOutput('artifact_id', String(artifact.id));
    return;
  }

  core.info(`No push run with artifact "${artifactName}" found on ${baseRef}; no baseline available.`);
};
