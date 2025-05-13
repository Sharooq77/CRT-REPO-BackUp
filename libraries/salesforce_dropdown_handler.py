from QWeb import QWeb
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

class CustomPicklist:
    def __init__(self):
        self.qweb = QWeb()
        self.builtin = BuiltIn()

    @keyword
    def select_picklist_value(self, field_label, value, timeout=10):
        """
        Selects a value from a picklist field.

        Args:
            field_label (str): The label of the picklist field
            value (str): The value to select
            timeout (int, optional): Timeout in seconds. Defaults to 10.
        """
        try:
            # Click the picklist field to open dropdown
            self.qweb.click_text(field_label, timeout=timeout)
            # Select the desired value
            self.qweb.click_text(value, timeout=timeout)
        except Exception as e:
            raise Exception(f"Failed to select value '{value}' in picklist '{field_label}': {str(e)}")

    @keyword
    def select_picklist_value_with_search(self, field_label, value, timeout=10):
        """
        Selects a value from a searchable picklist field.
        """
        try:
            # Click the picklist field
            self.qweb.click_text(field_label, timeout=timeout)
            # Type the value in the search box
            self.qweb.type_text(f"{field_label} search", value)
            # Click the value in dropdown
            self.qweb.click_text(value, timeout=timeout)
        except Exception as e:
            raise Exception(f"Failed to select value '{value}' in searchable picklist '{field_label}': {str(e)}")