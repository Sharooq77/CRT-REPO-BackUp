from QWeb import QWeb
from robot.api.deco import keyword

class SalesforceDropdownHandler:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        self.qweb = QWeb()

    @keyword
    def select_from_custom_picklist(self, field_label, value, timeout=10):
        """Selects a value from a Salesforce picklist"""
        try:
            self.qweb.click_text(field_label, timeout=timeout)
            self.qweb.click_text(value, timeout=timeout)
        except Exception as e:
            raise Exception(f"Failed to select '{value}' from picklist '{field_label}': {str(e)}")

    @keyword
    def select_from_searchable_picklist(self, field_label, value, timeout=10):
        """Selects a value from a searchable Salesforce picklist"""
        try:
            self.qweb.click_text(field_label, timeout=timeout)
            self.qweb.type_text(f"{field_label} search", value)
            self.qweb.click_text(value, timeout=timeout)
        except Exception as e:
            raise Exception(f"Failed to select '{value}' from searchable picklist '{field_label}': {str(e)}")