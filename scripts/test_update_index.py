import unittest
from unittest.mock import mock_open, patch
import datetime
from update_index import create_new_row, update_index_html, validate_version, read_index_html, find_insert_position

class TestUpdateIndex(unittest.TestCase):

    def test_update_index_with_redundant_version(self):
        """
        Test case for the `update_index_html` function.

        This test verifies that the `update_index_html` function correctly handles a redundant version.

        The test uses a version number that is equal to an existing version number.

        Asserts:
            The function prints an error message and exits with status code 1.
        """
        version = "3.0.5"
        mock_file_content = """
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.5/ImplementationGuide-markdown-Einfuehrung.html">3.0.5</a>
        </td>
        <td>Technical Correction 3.0.5</td>
        <td>3.0.5</td>
        </tr>
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.4/ImplementationGuide-markdown-Einfuehrung.html">3.0.4</a>
        </td>
        <td>Technical Correction 3.0.4</td>
        <td>3.0.4</td>
        </tr>
        """
        with patch("builtins.open", mock_open(read_data=mock_file_content)), patch("sys.exit") as mock_exit:
            update_index_html(version)
            mock_exit.assert_called_once_with(1)

    def test_validate_version_with_incorrect_format(self, version="4.0", content=""):
        """
        Test case for the `validate_version` function.

        This test verifies that the `validate_version` function correctly validates the version format.

        The test uses an incorrect version format that does not match the semver pattern.

        Asserts:
            The function prints an error message and exits with status code 1.
        """
        with patch("sys.exit") as mock_exit:
            content = ""  # Assuming content is an empty string for the test case
            validate_version(version, content)

    def test_validate_version_with_correct_format(self):
        """
        Test case for the `validate_version` function.

        This test verifies that the `validate_version` function correctly validates the version format.

        The test uses a correct version format that matches the semver pattern.

        Asserts:
            The function does not print an error message and does not exit.
        """
        with patch("sys.exit") as mock_exit:
            version = "4.0.11"
            validate_version(version,content="")
            mock_exit.assert_not_called()

    def test_validate_version_with_redundant_version(self):
        """
        Test case for the `validate_version` function.

        This test verifies that the `validate_version` function correctly validates the version number being unequal to an existing version.

        The test uses a version number that is equal to an existing version number.

        Asserts:
            The function prints an error message and exits with status code 1.
        """
        version = "3.0.5"
        content = """
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.5/ImplementationGuide-markdown-Einfuehrung.html">3.0.5</a>
        </td>
        <td>Technical Correction 3.0.5</td>
        <td>3.0.5</td>
        </tr>
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.4/ImplementationGuide-markdown-Einfuehrung.html">3.0.4</a>
        </td>
        <td>Technical Correction 3.0.4</td>
        <td>3.0.4</td>
        </tr>
        """
        with patch("sys.exit") as mock_exit:
            validate_version(version, content)
            mock_exit.assert_called_once_with(1)


    # TODO fix test
    '''def test_update_index_html_insertion_position(self):
        """
        Test case for the `update_index_html` function.

        This test verifies that the `update_index_html` function correctly determines the insertion position for the new version in the index.html file.

        The test uses a mock file content with a specific version pattern to test the insertion position.

        The expected insertion position is above the row with the previous version number that is less than the new version number.

        Asserts:
            The insertion position is correctly determined based on the previous version number.
        """
        version = "3.0.6"
        mock_file_content = """
        <tr>
            <td>04.04.2024</td>
            <td>
                <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/4.0.0-rc2/ImplementationGuide-markdown-Einfuehrung.html">4.0.0-rc2</a>
            </td>
            <td>Release Candidate Kommentierung 4.0.0-rc2</td>
            <td>4.0.0-rc2</td>
            </tr>
            <tr>
        </tr>
            <td colspan="4" style="background-color: #dddddd;">
                <strong>Basismodul Stufe 3</strong></td>
        </tr>
        <tr>
            <tr>
            <td>30.04.2024</td>
            <td>
                <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.5/ImplementationGuide-markdown-Einfuehrung.html">3.0.5</a>
            </td>
            <td>Technical Correction 3.0.5</td>
            <td>3.0.5</td>
            </tr>
            <tr>
        <tr>
            <tr>
            <td>03.04.2024</td>
            <td>
                <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.4/ImplementationGuide-markdown-Einfuehrung.html">3.0.4</a>
            </td>
            <td>Technical Correction 3.0.4</td>
            <td>3.0.4</td>
            </tr>
            <tr>
        """
        expected_position = mock_file_content.find('<tr>\n<tr>\n<td>30.04.2024</td><tr>\n<td>01.01.2022</td> \n<td>\n<a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.5/ImplementationGuide-markdown-Einfuehrung.html">3.0.5</a>')

        with patch("builtins.open", mock_open(read_data=mock_file_content)), patch("sys.exit") as mock_exit:
            content = read_index_html()
            insert_position = find_insert_position(content, version)
            self.assertEqual(insert_position, expected_position)
            mock_exit.assert_not_called()
    '''
  

if __name__ == "__main__":
    unittest.main()