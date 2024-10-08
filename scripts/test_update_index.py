import unittest
from unittest.mock import mock_open, patch
import datetime
from update_index import create_new_row, update_index_html

class TestUpdateIndex(unittest.TestCase):

    def test_update_index_html_insertion_position(self,version="3.0.6"):
        """ 
        Test case for the `update_index_html` function. 
        This test verifies that the `update_index_html` function correctly determines the insertion position for the new version in the index.html file.
        The test uses a mock file content with a specific version pattern to test the insertion position.
        The expected insertion position is above the row with the previous version number that is less than the new version number. 

        Asserts: 
            The insertion position is correctly determined based on the previous version number.
        """
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
        with patch("builtins.open", mock_open(read_data=content)):
            with patch("os.path.join"):
                with patch("os.path.dirname") as mock_dirname:
                    mock_dirname.return_value = "path/to/project"
                    update_index_html(version)
        self.assertEqual(insert_position, 0)


    def test_create_new_row(self):
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
        version = "4.0.2"
        current_date = "30.01.2022"
        expected_row = f"""
        <tr>
        <td>{current_date}</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/{version}/ImplementationGuide-markdown-Einfuehrung.html">{version}</a>
        </td>
        <td>Technical Correction {version}</td>
        <td>{version}</td>
        </tr>
        """
        self.assertEqual(create_new_row(version, current_date).strip(), expected_row.strip())

if __name__ == "__main__":
    unittest.main()