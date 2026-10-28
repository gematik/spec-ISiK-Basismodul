#!/usr/bin/env python3
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

"""Regression tests for release_publish.py.

Run from the repository root (no extra dependencies besides PyYAML)::

    python3 scripts/test_release_publish.py

The end-to-end tests use the real ``scripts/config.yaml`` against minimal copies of the
Stufe-5 (Simplifier) and Stufe-6 (IG Publisher) repository layouts, so they also catch a
config that no longer fits the repository.
"""

import contextlib
import datetime
import io
import os
import sys
import tempfile
import textwrap
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import release_publish  # noqa: E402

DATE = datetime.date(2026, 10, 28)
RELEASE_NOTES_HEAD = textwrap.dedent("""\
    # Release Notes

    Im Rahmen der ISiK-Veröffentlichungen wird das Semantic Versioning verwendet.

    """)


def write(root, relative_path, content):
    path = os.path.join(root, *relative_path.split('/'))
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, 'w', encoding='utf-8', newline='') as handle:
        handle.write(content)


def read(root, relative_path):
    with open(os.path.join(root, *relative_path.split('/')), encoding='utf-8', newline='') as handle:
        return handle.read()


def run_main(args):
    """Run the script's main() and return (exit code, captured output)."""
    output = io.StringIO()
    cwd = os.getcwd()
    try:
        with contextlib.redirect_stdout(output):
            code = release_publish.main(args)
    finally:
        os.chdir(cwd)
    return code, output.getvalue()


class BranchNameTests(unittest.TestCase):

    def test_version_from_tc_branch(self):
        self.assertEqual(release_publish.version_from_branch_name('TC_5.2.0'), '5.2.0')
        self.assertEqual(release_publish.version_from_branch_name('TC-6.1.0'), '6.1.0')
        self.assertEqual(release_publish.version_from_branch_name('TC_5.99.999-testtest'), '5.99.999-testtest')
        self.assertEqual(release_publish.version_from_branch_name('TC_6.0.0-rc1'), '6.0.0-rc1')

    def test_prefix_is_removed_as_prefix_not_as_character_set(self):
        # str.lstrip('TC_') would also strip leading "T"/"C" characters of the version
        self.assertEqual(release_publish.version_from_branch_name('TC_CT1.0.0'), 'CT1.0.0')

    def test_non_tc_branch_is_rejected(self):
        with self.assertRaises(ValueError):
            release_publish.version_from_branch_name('main-stufe-6')

    def test_stufe_from_branch(self):
        self.assertEqual(release_publish.stufe_from_branch_name('TC_5.2.0'), '5')
        self.assertEqual(release_publish.stufe_from_branch_name('TC-6.1.0'), '6')
        self.assertIsNone(release_publish.stufe_from_branch_name('main-stufe-6'))


class ReleaseNotesTests(unittest.TestCase):

    def test_existing_section_for_new_version_gets_date_only(self):
        text = RELEASE_NOTES_HEAD + "## Version 5.2.0\n\nDatum: 19.10.2026\n\n* `fix` something\n\n## Version 5.1.3\n\nDatum: 20.07.2026\n"
        result, action = release_publish.update_release_notes(text, '5.2.0', '28.10.2026')
        self.assertEqual(action, 'date')
        self.assertIn("## Version 5.2.0\n\nDatum: 28.10.2026\n\n* `fix` something", result)
        self.assertIn("## Version 5.1.3\n\nDatum: 20.07.2026", result)
        self.assertEqual(result.count('## Version'), 2)

    def test_older_section_on_top_is_kept_and_new_section_inserted(self):
        # PTDATA-2435: the previous release must not be renamed to the new version
        text = RELEASE_NOTES_HEAD + "## Version 5.1.3\n\nDatum: 20.07.2026\n\n* Keine Änderung am IG\n"
        result, action = release_publish.update_release_notes(text, '5.2.0', '28.10.2026')
        self.assertEqual(action, 'inserted')
        expected = RELEASE_NOTES_HEAD + ("## Version 5.2.0\n\nDatum: 28.10.2026\n\n* Keine Änderung am IG\n\n"
                                         "## Version 5.1.3\n\nDatum: 20.07.2026\n\n* Keine Änderung am IG\n")
        self.assertEqual(result, expected)

    def test_placeholder_heading_is_filled(self):
        text = "### Version 6.x.y\n\nDatum: tbd.\n\n* `improve` A\n\n### Version 6.0.0\n\nDatum: 01.07.2026\n"
        result, action = release_publish.update_release_notes(text, '6.1.0', '28.10.2026')
        self.assertEqual(action, 'placeholder')
        self.assertTrue(result.startswith("### Version 6.1.0\n\nDatum: 28.10.2026\n\n* `improve` A\n"))
        self.assertIn("### Version 6.0.0\n\nDatum: 01.07.2026", result)

    def test_tbd_date_of_already_set_version_is_filled(self):
        # situation of PR #1362: heading set by hand, date still a placeholder
        text = "### Version 6.1.0\n\nDatum: tbd.\n\n* `improve` A\n"
        result, action = release_publish.update_release_notes(text, '6.1.0', '28.10.2026')
        self.assertEqual(action, 'date')
        self.assertEqual(result, "### Version 6.1.0\n\nDatum: 28.10.2026\n\n* `improve` A\n")

    def test_heading_level_is_preserved_on_insert(self):
        text = "### Version 6.0.0\n\nDatum: 01.07.2026\n"
        result, action = release_publish.update_release_notes(text, '6.1.0', '28.10.2026')
        self.assertEqual(action, 'inserted')
        self.assertTrue(result.startswith("### Version 6.1.0\n\nDatum: 28.10.2026\n\n* Keine Änderung am IG\n\n### Version 6.0.0"))

    def test_version_with_suffix_text_is_a_real_version(self):
        text = "### Version 6.0.0-rc1 (Benehmensherstellung)\n\nDatum: 10.06.2026\n"
        result, action = release_publish.update_release_notes(text, '6.0.0', '28.10.2026')
        self.assertEqual(action, 'inserted')
        self.assertIn("### Version 6.0.0-rc1 (Benehmensherstellung)\n\nDatum: 10.06.2026", result)

    def test_date_of_a_later_section_is_not_touched(self):
        text = "## Version 5.2.0\n\n* no date line here\n\n## Version 5.1.3\n\nDatum: 20.07.2026\n"
        result, action = release_publish.update_release_notes(text, '5.2.0', '28.10.2026')
        self.assertEqual(action, 'date')
        self.assertIn("## Version 5.2.0\n\nDatum: 28.10.2026\n\n* no date line here", result)
        self.assertIn("Datum: 20.07.2026", result)

    def test_crlf_files_keep_their_line_endings(self):
        text = "## Version 5.1.3\r\n\r\nDatum: 20.07.2026\r\n"
        result, action = release_publish.update_release_notes(text, '5.2.0', '28.10.2026')
        self.assertEqual(action, 'inserted')
        self.assertTrue(result.startswith("## Version 5.2.0\r\n\r\nDatum: 28.10.2026\r\n\r\n* Keine Änderung am IG\r\n\r\n## Version 5.1.3"))
        self.assertNotIn('\n\n', result.replace('\r\n', ''))

    def test_file_without_heading_is_reported(self):
        result, action = release_publish.update_release_notes("# Release Notes\n", '5.2.0', '28.10.2026')
        self.assertIsNone(action)
        self.assertEqual(result, "# Release Notes\n")


class ExclusionTests(unittest.TestCase):

    def test_keyword_matches_directory_names_of_both_layouts(self):
        self.assertTrue(release_publish.is_excluded('guides/Formulare-5/Einfuehrung/Index.page.md', ['formular']))
        self.assertTrue(release_publish.is_excluded('publisher-guides/Subscription/sushi-config.yaml', ['subscription']))
        self.assertFalse(release_publish.is_excluded('guides/Basis-5/Einfuehrung/Index.page.md', ['formular', 'subscription']))
        self.assertFalse(release_publish.is_excluded('package.json', ['package']))

    def test_cli_overrides_config_and_reports_mismatch(self):
        config = {'excluded_igs': {'5': ['formular', 'subscription'], '6': []}}
        self.assertEqual(release_publish.excluded_igs_from_config(config, '5'), ['formular', 'subscription'])
        self.assertEqual(release_publish.excluded_igs_from_config(config, '6'), [])
        self.assertEqual(release_publish.excluded_igs_from_config(config, None), [])
        output = io.StringIO()
        with contextlib.redirect_stdout(output):
            self.assertEqual(release_publish.resolve_excluded_igs('formular', config, '5'), ['formular'])
        self.assertIn('Warning', output.getvalue())
        self.assertEqual(release_publish.resolve_excluded_igs('', config, '5'), ['formular', 'subscription'])


class Stufe5LayoutTests(unittest.TestCase):
    """End-to-end run with the real config.yaml against the Simplifier layout."""

    def setUp(self):
        self.root = tempfile.mkdtemp(prefix='release_publish_stufe5_')
        write(self.root, 'package.json', '{\n  "name": "de.gematik.isik-basismodul",\n  "version": "5.1.3",\n  "fhirVersions": ["4.0.1"]\n}\n')
        write(self.root, 'scripts/QualityAssuranceAutomation/package.json', '{\n  "name": "qa",\n  "version": "5.1.3"\n}\n')
        write(self.root, 'Resources/sushi-config.yaml', 'canonical: https://gematik.de/fhir/isik\nfhirVersion: 4.0.1\nFSHOnly: true\n')
        write(self.root, 'Resources/input/fsh/_Commons/ruleset.fsh',
              'Alias: $ISIKVersion = 5.1.3\n\nRuleSet: Meta\n* ^version = $ISIKVersion\n* ^date = "2026-07-17"\n\n'
              'RuleSet: MetaInstance\n* version = $ISIKVersion\n* date = "2026-07-17"\n')
        for ig in ('Basis-5', 'Labor-5', 'Formulare-5', 'Subscriptions-5'):
            write(self.root, f'guides/{ig}/Einfuehrung/Index.page.md',
                  '---\ntopic: Einfuehrung\n---\n----\nVersion: 5.1.3\n\nDatum: 17.07.2026\n\nStatus: Aktiv\n')
            write(self.root, f'guides/{ig}/Einfuehrung/Artefakte/Index.page.md', 'Version: 5.1.3\n\nDatum: 17.07.2026\n')
            write(self.root, f'guides/{ig}/Einfuehrung/ReleaseNotes.page.md',
                  RELEASE_NOTES_HEAD + '## Version 5.1.3\n\nDatum: 20.07.2026\n\n* Keine Änderung am IG\n')
        write(self.root, 'ImplementationGuide/markdown/Einfuehrung.md', '----\n\nVersion: 5.1.3\n\nDatum: 17.07.2026\n\nStatus: Aktiv\n')
        write(self.root, 'ImplementationGuide/markdown/ReleaseNotes.md', '## Version 5.1.3\n\nDatum: 17.07.2026\n')

    def test_full_update(self):
        code, output = run_main(['-v', '5.2.0', '-d', '28.10.2026', '-s', '5', '--root', self.root])
        self.assertEqual(code, 0, output)

        self.assertIn('"version": "5.2.0"', read(self.root, 'package.json'))
        # package.json of the QA tooling is not a release artefact
        self.assertIn('"version": "5.1.3"', read(self.root, 'scripts/QualityAssuranceAutomation/package.json'))
        ruleset = read(self.root, 'Resources/input/fsh/_Commons/ruleset.fsh')
        self.assertIn('Alias: $ISIKVersion = 5.2.0', ruleset)
        self.assertEqual(ruleset.count('"2026-10-28"'), 2)
        self.assertNotIn('2026-07-17', ruleset)
        self.assertIn('Version: 5.2.0\n\nDatum: 28.10.2026', read(self.root, 'ImplementationGuide/markdown/Einfuehrung.md'))
        # files not covered by the configuration stay untouched
        self.assertIn('fhirVersion: 4.0.1', read(self.root, 'Resources/sushi-config.yaml'))
        self.assertIn('## Version 5.1.3\n\nDatum: 17.07.2026', read(self.root, 'ImplementationGuide/markdown/ReleaseNotes.md'))

        for ig in ('Basis-5', 'Labor-5'):
            self.assertIn('Version: 5.2.0\n\nDatum: 28.10.2026', read(self.root, f'guides/{ig}/Einfuehrung/Index.page.md'))
            # only the Index.page.md directly below Einfuehrung/ carries the IG version
            self.assertIn('Version: 5.1.3', read(self.root, f'guides/{ig}/Einfuehrung/Artefakte/Index.page.md'))
            notes = read(self.root, f'guides/{ig}/Einfuehrung/ReleaseNotes.page.md')
            self.assertIn('## Version 5.2.0\n\nDatum: 28.10.2026\n\n* Keine Änderung am IG\n\n## Version 5.1.3\n\nDatum: 20.07.2026', notes)
        for ig in ('Formulare-5', 'Subscriptions-5'):
            self.assertIn('Version: 5.1.3', read(self.root, f'guides/{ig}/Einfuehrung/Index.page.md'))
            self.assertNotIn('5.2.0', read(self.root, f'guides/{ig}/Einfuehrung/ReleaseNotes.page.md'))
        self.assertIn("Skipped excluded IG files", output)

    def test_second_run_is_idempotent(self):
        run_main(['-v', '5.2.0', '-d', '28.10.2026', '-s', '5', '--root', self.root])
        snapshot = {path: read(self.root, path) for path in ('package.json', 'guides/Basis-5/Einfuehrung/ReleaseNotes.page.md')}
        code, output = run_main(['-v', '5.2.0', '-d', '28.10.2026', '-s', '5', '--root', self.root])
        self.assertEqual(code, 0, output)
        for path, content in snapshot.items():
            self.assertEqual(read(self.root, path), content)
        self.assertEqual(read(self.root, 'guides/Basis-5/Einfuehrung/ReleaseNotes.page.md').count('## Version 5.2.0'), 1)

    def test_dry_run_changes_nothing(self):
        before = read(self.root, 'package.json')
        code, output = run_main(['-v', '5.2.0', '-d', '28.10.2026', '-s', '5', '--dry-run', '--root', self.root])
        self.assertEqual(code, 0, output)
        self.assertEqual(read(self.root, 'package.json'), before)
        self.assertIn('would update', output)

    def test_cli_exclusion_overrides_config(self):
        code, output = run_main(['-v', '5.2.0', '-d', '28.10.2026', '-s', '5', '-x', 'labor', '--root', self.root])
        self.assertEqual(code, 0, output)
        self.assertIn('Warning', output)
        self.assertIn('Version: 5.1.3', read(self.root, 'guides/Labor-5/Einfuehrung/Index.page.md'))
        self.assertIn('Version: 5.2.0', read(self.root, 'guides/Formulare-5/Einfuehrung/Index.page.md'))

    def test_missing_pattern_in_matched_file_fails(self):
        write(self.root, 'Resources/input/fsh/_Commons/ruleset.fsh', 'RuleSet: Meta\n* ^status = #active\n')
        code, output = run_main(['-v', '5.2.0', '-d', '28.10.2026', '-s', '5', '--root', self.root])
        self.assertEqual(code, 1)
        self.assertIn("Error: 'Resources/input/fsh/_Commons/ruleset.fsh'", output)


class Stufe6LayoutTests(unittest.TestCase):
    """End-to-end run with the real config.yaml against the IG Publisher layout."""

    def setUp(self):
        self.root = tempfile.mkdtemp(prefix='release_publish_stufe6_')
        write(self.root, 'package.json', '{\n  "name": "de.gematik.isik-basismodul",\n  "version": "6.0.0"\n}\n')
        write(self.root, 'scripts/QualityAssuranceAutomation/package.json', '{\n  "version": "6.0.0"\n}\n')
        write(self.root, 'Resources/sushi-config.yaml', 'canonical: https://gematik.de/fhir/isik\nfhirVersion: 4.0.1\n')
        write(self.root, 'Resources/input/fsh/_Commons/ruleset.fsh',
              'Alias: $ISIKVersion = 6.0.0\n\nRuleSet: Meta\n* ^version = $ISIKVersion\n* ^date = "2026-07-01"\n\n'
              'RuleSet: MetaInstance\n* version = $ISIKVersion\n* date = "2026-07-01"\n')
        for ig in ('Basis', 'Labor', 'Formular', 'Subscription'):
            write(self.root, f'publisher-guides/{ig}/sushi-config.yaml',
                  f'id: {ig.lower()}\ncanonical: https://gematik.de/fhir/isik\nname: ISiK{ig}\nversion: 6.0.0\nfhirVersion: 4.0.1\n')
        write(self.root, 'publisher-guides/Basis/input/pagecontent/ReleaseNotes.md',
              RELEASE_NOTES_HEAD + '### Version 6.x.y\n\nDatum: tbd.\n\n* `improve` A\n\n### Version 6.0.0\n\nDatum: 01.07.2026\n')
        write(self.root, 'publisher-guides/Labor/input/pagecontent/ReleaseNotes.md',
              RELEASE_NOTES_HEAD + '### Version 6.0.0\n\nDatum: 01.07.2026\n\n* Keine Änderung am IG\n')
        write(self.root, 'publisher-guides/Formular/input/pagecontent/ReleaseNotes.md',
              RELEASE_NOTES_HEAD + '### Version 6.0.0\n\nDatum: 01.07.2026\n')

    def test_full_update(self):
        code, output = run_main(['-v', '6.1.0', '-d', '28.10.2026', '-s', '6', '--root', self.root])
        self.assertEqual(code, 0, output)

        self.assertIn('"version": "6.1.0"', read(self.root, 'package.json'))
        self.assertIn('"version": "6.0.0"', read(self.root, 'scripts/QualityAssuranceAutomation/package.json'))
        self.assertIn('Alias: $ISIKVersion = 6.1.0', read(self.root, 'Resources/input/fsh/_Commons/ruleset.fsh'))
        self.assertIn('"2026-10-28"', read(self.root, 'Resources/input/fsh/_Commons/ruleset.fsh'))
        self.assertIn('fhirVersion: 4.0.1', read(self.root, 'Resources/sushi-config.yaml'))
        # no IG is excluded in Stufe 6
        for ig in ('Basis', 'Labor', 'Formular', 'Subscription'):
            sushi = read(self.root, f'publisher-guides/{ig}/sushi-config.yaml')
            self.assertIn('version: 6.1.0', sushi)
            self.assertIn('fhirVersion: 4.0.1', sushi)
        basis = read(self.root, 'publisher-guides/Basis/input/pagecontent/ReleaseNotes.md')
        self.assertIn('### Version 6.1.0\n\nDatum: 28.10.2026\n\n* `improve` A\n\n### Version 6.0.0\n\nDatum: 01.07.2026', basis)
        self.assertNotIn('6.x.y', basis)
        labor = read(self.root, 'publisher-guides/Labor/input/pagecontent/ReleaseNotes.md')
        self.assertIn('### Version 6.1.0\n\nDatum: 28.10.2026\n\n* Keine Änderung am IG\n\n### Version 6.0.0\n\nDatum: 01.07.2026', labor)
        # patterns of the other layout are reported as skipped, not as errors
        self.assertIn("matches no file", output)
        self.assertNotIn("Error", output)

    def test_second_run_is_idempotent(self):
        run_main(['-v', '6.1.0', '-d', '28.10.2026', '-s', '6', '--root', self.root])
        code, output = run_main(['-v', '6.1.0', '-d', '28.10.2026', '-s', '6', '--root', self.root])
        self.assertEqual(code, 0, output)
        self.assertEqual(read(self.root, 'publisher-guides/Labor/input/pagecontent/ReleaseNotes.md').count('### Version 6.1.0'), 1)


class ConfigTests(unittest.TestCase):

    def test_real_config_loads(self):
        config = release_publish.load_config(os.path.join(release_publish.SCRIPT_DIR, 'config.yaml'))
        rules = release_publish.create_rules(config['files'])
        self.assertTrue(any(rule.type == 'releasenotes' for rule in rules))
        self.assertEqual(release_publish.excluded_igs_from_config(config, '5'), ['formular', 'subscription'])
        self.assertEqual(release_publish.excluded_igs_from_config(config, '6'), [])

    def test_invalid_rule_is_rejected(self):
        with self.assertRaises(ValueError):
            release_publish.create_rules({'x.md': [{'type': 'date', 'regex': 'a'}]})
        with self.assertRaises(ValueError):
            release_publish.create_rules({'x.md': [{'type': 'unknown'}]})


if __name__ == '__main__':
    unittest.main(verbosity=2)
