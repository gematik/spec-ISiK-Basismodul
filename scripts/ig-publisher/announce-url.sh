#!/usr/bin/env bash
set -euo pipefail

repo_owner="${GITHUB_REPOSITORY_OWNER}"
repo_name="${GITHUB_REPOSITORY#*/}"
branch="${GITHUB_HEAD_REF:-${GITHUB_REF_NAME}}"
ig_name="${IG_NAME}"
url="https://${repo_owner}.github.io/${repo_name}/${branch}/${ig_name}/"

echo "Published ${ig_name} to ${url}"
printf '### Deployment: %s\n[Open published IG for branch `%s`](%s)\n' "${ig_name}" "${branch}" "${url}" >> "${GITHUB_STEP_SUMMARY}"

mkdir -p "${GITHUB_WORKSPACE}/.ig-urls-temp"
echo "${ig_name}|${url}" >> "${GITHUB_WORKSPACE}/.ig-urls-temp/urls.txt"
