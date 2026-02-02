#!/usr/bin/env bash
set -euo pipefail

branch_name="${GITHUB_HEAD_REF:-${GITHUB_REF_NAME}}"
remote_url="https://x-access-token:${GITHUB_TOKEN}@github.com/${REPO}.git"

if [ -z "${branch_name}" ] || [ -z "${IG_NAME}" ]; then
  echo "Missing branch name or IG name; refusing to publish."
  exit 1
fi

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
case "${branch_dir}" in
  gh-pages|gh-pages/|gh-pages/.|gh-pages/..)
    echo "Refusing to modify root path: ${branch_dir}"
    exit 1
    ;;
  gh-pages/IG|gh-pages/IG/*)
    echo "Refusing to modify protected path: ${branch_dir}"
    exit 1
    ;;
esac
rm -rf "${branch_dir}"
mkdir -p "${branch_dir}"
cp -R "${IG_PUBLISHER_DIR}/output/." "${branch_dir}/"

cd gh-pages
git config user.name "${GIT_AUTHOR_NAME}"
git config user.email "${GIT_AUTHOR_EMAIL}"
if [ ! -f .nojekyll ]; then
  touch .nojekyll
fi
git add --all
if git diff --cached --quiet; then
  echo "No updates to publish."
  exit 0
fi
git checkout --orphan temp-gh-pages
git add --all
git commit -m "chore: update ${branch_name}/${IG_NAME} pages"
git push --force origin HEAD:gh-pages
echo "Published to gh-pages with a fresh orphan commit."
