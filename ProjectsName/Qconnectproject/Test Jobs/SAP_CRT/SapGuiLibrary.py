from robot.api.deco import keyword
import win32com.client

class SapGuiLibrary:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    
    @keyword
    def set_sap_element_text(self, element_path, text):
        """Sets text for SAP GUI element using technical path"""
        try:
            # Get existing SAP GUI session
            sap_gui_auto = win32com.client.GetObject("SAPGUI")
            application = sap_gui_auto.GetScriptingEngine
            connection = application.Children(0)
            session = connection.Children(0)
            
            # Set the text
            element = session.findById(element_path)
            element.text = text
            
        except Exception as e:
            raise Exception(f"Failed to set text in element {element_path}: {str(e)}")
