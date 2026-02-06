#!/usr/bin/env bash
set -euo pipefail

branch_name="${GITHUB_HEAD_REF:-${GITHUB_REF_NAME}}"
remote_url="https://x-access-token:${GITHUB_TOKEN}@github.com/${REPO}.git"
publish_output_dir="${PUBLISH_OUTPUT_DIR:-publish-output}"

if [ -z "${branch_name}" ]; then
  echo "Missing branch name; refusing to publish."
  exit 1
fi

if [ ! -d "${publish_output_dir}" ]; then
  echo "Publish output directory not found: ${publish_output_dir}"
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

shopt -s nullglob
for dir in "${publish_output_dir}"/fhir-ig-*; do
  if [ ! -d "${dir}" ] || [ -z "$(ls -A "${dir}")" ]; then
    continue
  fi

  ig_name="${dir##*/}"
  ig_name="${ig_name#fhir-ig-}"
  branch_dir="gh-pages/${branch_name}/${ig_name}"
  echo "Publishing ${ig_name} to ${branch_dir}/"
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

  mkdir -p "${dir}/output"
  for item in "${dir}"/*; do
    if [ "$(basename "${item}")" = "output" ]; then
      continue
    fi
    mv "${item}" "${dir}/output/"
  done

  cp -R "${dir}/output/." "${branch_dir}/"
done

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
git commit -m "chore: update ${branch_name} pages"
for attempt in 1 2 3; do
  if git push --force origin HEAD:gh-pages; then
    echo "Published to gh-pages with a fresh orphan commit."
    exit 0
  fi
  echo "Push failed; retrying (${attempt}/3)..."
  git fetch origin gh-pages
  sleep 2
done
echo "Failed to publish to gh-pages after retries."
exit 1
