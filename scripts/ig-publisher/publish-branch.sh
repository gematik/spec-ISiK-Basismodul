#!/usr/bin/env bash
set -euo pipefail

branch_name="${GITHUB_HEAD_REF:-${GITHUB_REF_NAME}}"
remote_url="https://x-access-token:${GITHUB_TOKEN}@github.com/${REPO}.git"

rm -rf gh-pages

if git ls-remote --heads "${remote_url}" gh-pages | grep -q "."; then
  git clone --depth 1 --branch gh-pages "${remote_url}" gh-pages
else
  git clone "${remote_url}" gh-pages
  cd gh-pages
  git checkout --orphan gh-pages
  git rm -rf . >/dev/null 2>&1 || true
  touch .nojekyll
  git add .nojekyll
  git commit -m "chore: initialize gh-pages"
  git push --set-upstream origin gh-pages
  cd ..
fi

branch_dir="gh-pages/${branch_name}/${IG_NAME}"
rm -rf "${branch_dir}"
mkdir -p "${branch_dir}"
cp -R "${IG_PUBLISHER_DIR}/output/." "${branch_dir}/"

cd gh-pages
git config user.name "${GIT_AUTHOR_NAME}"
git config user.email "${GIT_AUTHOR_EMAIL}"
git add --all
if git diff --cached --quiet; then
  echo "No updates to publish."
  exit 0
fi
git commit -m "chore: update ${branch_name}/${IG_NAME} pages"
git push origin gh-pages
