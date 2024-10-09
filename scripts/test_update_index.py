import unittest
from unittest.mock import mock_open, patch
import datetime
from update_index import create_new_row, update_index_html, validate_version

class TestUpdateIndex(unittest.TestCase):

#TODO currently thes modify index.html file, so we need to mock the file content and test the functions 

    def test_update_index_with_redundant_version(self):
        """
        Test case for the `update_index_html` function.

        This test verifies that the `update_index_html` function correctly handles a redundant version.

        The test uses a version number that is equal to an existing version number.

        Asserts:
            The function prints an error message and exits with status code 1.
        """
        version = "3.0.5"
        with patch("sys.exit") as mock_exit:
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



    # TODO def test_update_index_html_insertion_position(self,version="3.0.6"):
        """ 
        One Test case for the `update_index_html` function. 
        This test verifies that the `update_index_html` function correctly determines the insertion position for the new version in the index.html file.
        The test uses a mock file content with a specific version pattern to test the insertion position.
        The expected insertion position is above the row with the previous version number that is less than the new version number. 

        Asserts: 
            The insertion position is correctly determined based on the previous version number.
        """



    # TODO ? def test_create_new_row(self):
        """
        Test case for the `create_new_row` function.

        This test verifies that the `create_new_row` function correctly generates
        an HTML table row with the given version and current date.

        The expected HTML row includes:
        - The current date in the first cell.
        - A hyperlink to the Implementation Guide for the given version in the second cell.
        - A description "Technical Correction" followed by the version in the third cell.
        - The version in the fourth cell.

        The test compares the generated row with the expected row to ensure they match.

        Args:
            self: The test case instance.

        Asserts:
            The generated HTML row matches the expected HTML row.
        """
        # TODO
  

if __name__ == "__main__":
    unittest.main()