from robot.api import logger
from QForce import QForce
from robot.api.deco import keyword
import time

class SalesforceDropdownHandler:
    """Custom Library for handling Salesforce dropdown operations

    This library provides enhanced functionality for working with:
    - Standard Picklists
    - Multi-Select Picklists
    - Comboboxes
    - Dependent Picklists
    """

    def __init__(self):
        self.qforce = QForce()

    @keyword
    def select_picklist_value(self, label, value, wait_after=1, index=1):
        """Selects a value from a standard Salesforce picklist with enhanced error handling

        Args:
            label: Label of the picklist field
            value: Value to select
            wait_after: Time to wait after selection (default=1)
            index: If multiple picklists with same label exist (default=1)

        Example:
            Select Picklist Value    Stage    Closed Won    
            Select Picklist Value    Type    New Customer    wait_after=2    index=2
        """
        try:
            # Click the picklist to open it
            self.qforce.click_text(label, index=index)
            time.sleep(0.5)  # Small wait for animation

            # Select the value
            self.qforce.click_text(value)
            time.sleep(wait_after)

            # Verify selection
            field_value = self.qforce.verify_field(label, value)
            logger.info(f"Successfully selected '{value}' in picklist '{label}'")
            return True

        except Exception as e:
            logger.error(f"Failed to select value '{value}' in picklist '{label}': {str(e)}")
            raise

    @keyword
    def select_multiple_picklist_values(self, label, *values):
        """Selects multiple values in a multi-select picklist

        Args:
            label: Label of the multi-select picklist
            *values: Variable number of values to select

        Example:
            Select Multiple Picklist Values    Selected Products    Product A    Product B    Product C
        """
        try:
            # Click the multi-select picklist to open it
            self.qforce.click_text(label)
            time.sleep(0.5)

            # Select each value
            for value in values:
                self.qforce.click_text(value)
                logger.info(f"Selected value: {value}")

            # Click away to close the picklist
            self.qforce.click_text(label)
            logger.info(f"Successfully selected multiple values in picklist '{label}': {values}")

        except Exception as e:
            logger.error(f"Failed to select multiple values in picklist '{label}': {str(e)}")
            raise

    @keyword
    def select_dependent_picklist_values(self, controlling_label, controlling_value, 
                                       dependent_label, dependent_value):
        """Handles dependent picklist selection

        Args:
            controlling_label: Label of the controlling picklist
            controlling_value: Value to select in controlling picklist
            dependent_label: Label of the dependent picklist
            dependent_value: Value to select in dependent picklist

        Example:
            Select Dependent Picklist Values    Country    USA    State    California
        """
        try:
            # Select controlling field value first
            self.select_picklist_value(controlling_label, controlling_value)
            time.sleep(1)  # Wait for dependent picklist to update

            # Select dependent field value
            self.select_picklist_value(dependent_label, dependent_value)

            logger.info(f"Successfully selected dependent values: {controlling_value} -> {dependent_value}")

        except Exception as e:
            logger.error(f"Failed to select dependent picklist values: {str(e)}")
            raise

    @keyword
    def verify_picklist_options(self, label, *expected_values):
        """Verifies that a picklist contains the expected values

        Args:
            label: Label of the picklist
            *expected_values: Expected values to be present in the picklist

        Returns:
            bool: True if all expected values are present

        Example:
            Verify Picklist Options    Status    New    In Progress    Completed
        """
        try:
            # Open the picklist
            self.qforce.click_text(label)
            time.sleep(0.5)

            # Verify each expected value
            for value in expected_values:
                if not self.qforce.is_text(value):
                    logger.error(f"Expected value '{value}' not found in picklist '{label}'")
                    return False

            # Close the picklist
            self.qforce.click_text(label)
            logger.info(f"Successfully verified all expected values in picklist '{label}'")
            return True

        except Exception as e:
            logger.error(f"Failed to verify picklist options: {str(e)}")
            raise

    @keyword
    def clear_picklist_value(self, label):
        """Clears the selected value in a picklist (selects --None--)

        Args:
            label: Label of the picklist

        Example:
            Clear Picklist Value    Account Type
        """
        try:
            self.qforce.click_text(label)
            time.sleep(0.5)

            # Try different variations of "None" as it can appear differently
            none_values = ["--None--", "- None -", "None"]
            for none_value in none_values:
                try:
                    self.qforce.click_text(none_value)
                    logger.info(f"Successfully cleared picklist '{label}'")
                    return
                except:
                    continue

            raise Exception(f"Could not find None option in picklist '{label}'")

        except Exception as e:
            logger.error(f"Failed to clear picklist value: {str(e)}")
            raise