# Copyright 2026, gematik GmbH
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# *******
#
# For additional notes and disclaimer from gematik and in case of changes
# by gematik, find details in the "Readme" file.

"""Update the release version and date in all configured files of this repository.

The files and replacement rules are defined in ``config.yaml`` next to this script.
Every key below ``files`` is a glob pattern relative to the repository root. Patterns
without a match are skipped, so one configuration serves both repository layouts
(Simplifier guides in Stufe 5, IG Publisher guides in Stufe 6).

Typical call from the GitHub Action "TC version update" (version taken from the
branch name ``TC_<version>`` or ``TC-<version>``)::

    python scripts/release_publish.py -b

The script exits with a non-zero status when a matched file does not contain the
expected pattern or when nothing was updated at all, so that the action fails
instead of silently committing an incomplete update.
"""

import argparse
import datetime
import glob
import os
import re
import subprocess
import sys

import yaml

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.abspath(os.path.join(SCRIPT_DIR, os.pardir))
DEFAULT_CONFIG = 'config.yaml'

NO_CHANGE_TEXT = '* Keine Änderung am IG'
# Markdown heading of a release notes section, e.g. "## Version 5.2.0" or "### Version 6.x.y".
VERSION_HEADER_RE = re.compile(r'^(?P<prefix>#{1,6}[ \t]*Version[ \t]+)(?P<version>[^\r\n]*?)[ \t]*\r?$', re.MULTILINE)
DATE_LINE_RE = re.compile(r'^(?P<prefix>Datum:[ \t]*)(?P<date>[^\r\n]*?)[ \t]*\r?$', re.MULTILINE)
# A "real" version starts with three numbers; everything else ("6.x.y", "x.y.z", "tbd") is a placeholder.
REAL_VERSION_RE = re.compile(r'^\d+\.\d+\.\d+')


class Rule:
    """One replacement rule from config.yaml bound to a glob pattern."""

    def __init__(self, pattern, rule_type, regex_list=None, date_format=None):
        self.pattern = pattern
        self.type = rule_type
        self.regex_list = regex_list or []
        self.format = date_format

    def __repr__(self):
        return f"Rule({self.pattern!r}, {self.type!r})"


# --------------------------------------------------------------------------------------
# configuration
# --------------------------------------------------------------------------------------

def load_config(config_path):
    with open(config_path, 'r', encoding='utf-8') as config_file:
        config = yaml.safe_load(config_file) or {}
    if not isinstance(config.get('files'), dict):
        raise ValueError(f"'{config_path}' must contain a top-level 'files' mapping (pattern -> rules)")
    return config


def create_rules(files_config):
    rules = []
    for pattern, replacements in files_config.items():
        for replacement in replacements or []:
            regex = replacement.get('regex')
            if regex is None:
                regex_list = []
            elif isinstance(regex, list):
                regex_list = regex
            else:
                regex_list = [regex]
            rule_type = replacement['type']
            if rule_type not in ('version', 'date', 'releasenotes'):
                raise ValueError(f"Unknown rule type '{rule_type}' for pattern '{pattern}'")
            if rule_type in ('version', 'date') and not regex_list:
                raise ValueError(f"Rule '{rule_type}' for pattern '{pattern}' needs a 'regex'")
            if rule_type in ('date', 'releasenotes') and not replacement.get('format'):
                raise ValueError(f"Rule '{rule_type}' for pattern '{pattern}' needs a date 'format'")
            rules.append(Rule(pattern, rule_type, regex_list, replacement.get('format')))
    return rules


# --------------------------------------------------------------------------------------
# branch / version helpers
# --------------------------------------------------------------------------------------

def get_current_branch():
    return subprocess.check_output(['git', 'rev-parse', '--abbrev-ref', 'HEAD']).decode().strip()


def version_from_branch_name(git_branch):
    match = re.match(r'^TC[-_](.+)$', git_branch)
    if not match:
        raise ValueError(f"Branch '{git_branch}' is not a TC branch (expected 'TC_<version>' or 'TC-<version>')")
    return match.group(1)


def stufe_from_branch_name(git_branch):
    match = re.match(r'^TC[-_](\d+)', git_branch)
    return match.group(1) if match else None


# --------------------------------------------------------------------------------------
# replacements
# --------------------------------------------------------------------------------------

def replace_version(text, regex_list, new_version):
    """Replace group 2 of every regex with the new version. Returns (text, number of matches)."""
    total = 0
    for regex in regex_list:
        text, count = re.subn(regex, lambda m: m.group(1) + new_version + m.group(3), text, flags=re.MULTILINE)
        total += count
    return text, total


def replace_date(text, regex_list, date_string):
    """Replace group 2 of every regex with the formatted date. Returns (text, number of matches)."""
    total = 0
    for regex in regex_list:
        text, count = re.subn(regex, lambda m: m.group(1) + date_string + m.group(3), text, flags=re.MULTILINE)
        total += count
    return text, total


def update_release_notes(text, new_version, date_string):
    """Maintain the topmost "Version" section of a release notes file.

    * The topmost section already belongs to ``new_version``: only its date is set.
    * The topmost heading is a placeholder (e.g. "6.x.y", "tbd"): version and date are filled in.
    * The topmost section belongs to an older release: a new section with the default
      text "Keine Änderung am IG" is inserted above it. Existing sections are never renamed.

    Returns (text, action) where action is one of 'date', 'placeholder', 'inserted',
    or None when the file contains no "Version" heading.
    """
    header = VERSION_HEADER_RE.search(text)
    if header is None:
        return text, None

    newline = '\r\n' if '\r\n' in text else '\n'
    current_version = header.group('version').split()[0] if header.group('version').strip() else ''

    if current_version == new_version:
        action = 'date'
    elif not REAL_VERSION_RE.match(current_version):
        text = text[:header.start('version')] + new_version + text[header.end('version'):]
        header = VERSION_HEADER_RE.search(text)
        action = 'placeholder'
    else:
        section = (f"{header.group('prefix')}{new_version}{newline}{newline}"
                   f"Datum: {date_string}{newline}{newline}"
                   f"{NO_CHANGE_TEXT}{newline}{newline}")
        return text[:header.start()] + section + text[header.start():], 'inserted'

    next_header = VERSION_HEADER_RE.search(text, header.end())
    section_end = next_header.start() if next_header else len(text)
    date_match = DATE_LINE_RE.search(text, header.end(), section_end)
    if date_match:
        text = text[:date_match.start('date')] + date_string + text[date_match.end('date'):]
    else:
        text = text[:header.end()] + f"{newline}{newline}Datum: {date_string}" + text[header.end():]
    return text, action


def apply_rule(rule, text, new_version, release_date):
    """Apply one rule to the text. Returns (text, number of matches, description)."""
    if rule.type == 'version':
        text, count = replace_version(text, rule.regex_list, new_version)
        return text, count, f"version '{new_version}'"
    date_string = release_date.strftime(rule.format)
    if rule.type == 'date':
        text, count = replace_date(text, rule.regex_list, date_string)
        return text, count, f"date '{date_string}'"
    text, action = update_release_notes(text, new_version, date_string)
    descriptions = {
        'date': f"release notes: date '{date_string}' set for existing section '{new_version}'",
        'placeholder': f"release notes: placeholder heading filled with '{new_version}' / '{date_string}'",
        'inserted': f"release notes: new section '{new_version}' ({date_string}, '{NO_CHANGE_TEXT}') inserted",
    }
    return text, (1 if action else 0), descriptions.get(action, 'release notes: no "Version" heading found')


# --------------------------------------------------------------------------------------
# excluded IGs
# --------------------------------------------------------------------------------------

def excluded_igs_from_config(config, stufe):
    if not stufe:
        return []
    configured = {str(key): value for key, value in (config.get('excluded_igs') or {}).items()}
    return [str(ig).strip() for ig in (configured.get(str(stufe)) or []) if str(ig).strip()]


def resolve_excluded_igs(cli_value, config, stufe):
    """Exclusions from --exclude-igs win over config.yaml; a mismatch is reported."""
    configured = excluded_igs_from_config(config, stufe)
    if cli_value:
        cli_igs = [ig.strip() for ig in cli_value.split(',') if ig.strip()]
        if stufe and {ig.lower() for ig in cli_igs} != {ig.lower() for ig in configured}:
            print(f"Warning: --exclude-igs [{', '.join(cli_igs)}] differs from config.yaml for stufe '{stufe}' "
                  f"[{', '.join(configured)}]. Using the parameter; please keep both in sync.")
        return cli_igs
    return configured


def is_excluded(path, excluded_igs):
    """True when any directory of the path contains one of the keywords (case-insensitive)."""
    directories = [part.lower() for part in os.path.dirname(path).replace('\\', '/').split('/') if part]
    return any(keyword.lower() in directory for directory in directories for keyword in excluded_igs)


# --------------------------------------------------------------------------------------
# main processing
# --------------------------------------------------------------------------------------

def process_rules(rules, new_version, release_date, excluded_igs, dry_run=False):
    """Apply all rules below the current working directory. Returns (updated paths, problems)."""
    updated = []
    problems = []
    skipped = set()
    unmatched_patterns = set()

    for rule in rules:
        paths = sorted(glob.glob(rule.pattern, recursive=True))
        if not paths:
            if rule.pattern not in unmatched_patterns:
                unmatched_patterns.add(rule.pattern)
                print(f"Info: Pattern '{rule.pattern}' matches no file in this repository layout, skipped.")
            continue
        for path in paths:
            path = path.replace('\\', '/')
            if is_excluded(path, excluded_igs):
                skipped.add(path)
                continue
            with open(path, 'r', encoding='utf-8', newline='') as input_file:
                original = input_file.read()
            text, count, description = apply_rule(rule, original, new_version, release_date)
            if count == 0:
                problems.append(f"'{path}': rule '{rule.type}' did not match anything ({description}).")
                continue
            if text != original and not dry_run:
                with open(path, 'w', encoding='utf-8', newline='') as output_file:
                    output_file.write(text)
            state = 'would update' if dry_run else ('updated' if text != original else 'already up to date')
            print(f"Info: {state} '{path}': {description}.")
            updated.append(path)

    if skipped:
        print(f"Info: Skipped excluded IG files: {', '.join(sorted(skipped))}.")
    return updated, problems


def output_commit_messages_since_last_release():
    latest_release_tag = get_latest_release_tag()
    if latest_release_tag is None:
        print("Warning: No release tag found.")
        return
    try:
        output = subprocess.check_output(['git', 'log', '--pretty=format:%s', f'{latest_release_tag}..HEAD'])
        print(output.decode())
    except subprocess.CalledProcessError:
        print("Warning: Failed to get commit messages.")


def get_latest_release_tag():
    try:
        output = subprocess.check_output(['git', 'describe', '--abbrev=0', '--tags', '--match', 'v*.*.*', 'HEAD'],
                                         stderr=subprocess.DEVNULL)
        return output.decode().strip()
    except subprocess.CalledProcessError:
        return None


def build_parser():
    parser = argparse.ArgumentParser(description='Update release version number and date in all configured files')
    parser.add_argument('-b', '--branch', action='store_true', help='take the new version from the branch name (TC_<version> / TC-<version>)')
    parser.add_argument('-v', '--version', type=str, help='new version number, e.g. 5.2.0')
    parser.add_argument('-d', '--date', type=str, help='release date as DD.MM.YYYY (default: today)')
    parser.add_argument('-c', '--config', type=str, default=DEFAULT_CONFIG,
                        help='config file (relative paths are resolved against the scripts directory)')
    parser.add_argument('-s', '--stufe', type=str, default=None,
                        help='stufe (e.g. "5") used for the excluded_igs entry of the config; default: parsed from the branch name')
    parser.add_argument('-x', '--exclude-igs', type=str, default=None,
                        help='comma-separated IG keywords to exclude, overrides the excluded_igs of the config, e.g. "formular,subscription"')
    parser.add_argument('--root', type=str, default=REPO_ROOT, help=argparse.SUPPRESS)
    parser.add_argument('-n', '--dry-run', action='store_true', help='report what would change without writing files')
    parser.add_argument('-o', '--output', action='store_true', help='print commit messages since the last release tag')
    return parser


def main(argv=None):
    parser = build_parser()
    args = parser.parse_args(argv)

    os.chdir(args.root)

    git_branch = None
    if args.version:
        new_release_version = args.version
    elif args.branch:
        git_branch = get_current_branch()
        try:
            new_release_version = version_from_branch_name(git_branch)
        except ValueError as error:
            parser.error(str(error))
    else:
        parser.error('No new release version specified. Use -v <version> or -b.')

    if args.date:
        release_date = datetime.datetime.strptime(args.date, '%d.%m.%Y').date()
    else:
        release_date = datetime.date.today()

    stufe = args.stufe
    if stufe is None:
        if git_branch is None:
            try:
                git_branch = get_current_branch()
            except (subprocess.CalledProcessError, OSError):
                git_branch = ''
        stufe = stufe_from_branch_name(git_branch)

    config_path = args.config if os.path.isabs(args.config) else os.path.join(SCRIPT_DIR, args.config)
    config = load_config(config_path)
    rules = create_rules(config['files'])
    excluded_igs = resolve_excluded_igs(args.exclude_igs, config, stufe)

    print(f"Info: Updating to version '{new_release_version}', date {release_date.isoformat()}"
          f"{' (dry run)' if args.dry_run else ''}; stufe: {stufe or 'unknown'}; "
          f"excluded IGs: {', '.join(excluded_igs) if excluded_igs else 'none'}.")

    updated, problems = process_rules(rules, new_release_version, release_date, excluded_igs, args.dry_run)

    if args.output:
        output_commit_messages_since_last_release()

    for problem in problems:
        print(f"Error: {problem}")
    if not updated:
        print("Error: No file was updated. Check config.yaml against the repository layout.")
        return 1
    if problems:
        return 1
    print(f"Info: {len(set(updated))} file(s) {'would be ' if args.dry_run else ''}updated.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
