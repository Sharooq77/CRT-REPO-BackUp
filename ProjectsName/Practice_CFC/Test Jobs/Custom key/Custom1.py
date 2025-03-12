from robot.api.deco import keyword
from QWeb.keywords import element

class Custom1:
    
    def compare(self, data1, data2):
        """
        Custom keyword to compare data of two different data sources.
        """
        return data1 == data2

    @keyword
    def click_text(self, text):
        """
        Custom keyword to click on a text element using QWeb.
        """
        element.click_text(text)

    @keyword
    def type_text(self, locator, text):
        """
        Custom keyword to type text into a field using QWeb.
        """
        element.input_text(locator, text)
