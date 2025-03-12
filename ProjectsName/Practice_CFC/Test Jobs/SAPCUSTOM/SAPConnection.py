import subprocess
import time
from robot.api.deco import keyword
from QWeb import QWeb

class SAPConnection:
    def __init__(self):
        self.qweb = QWeb()

    @keyword
    def connect_to_sap(self, sap_path, username, password):
        # Construct the SAP logon command
        sap_command = f'saplogon.exe "{sap_path}"'
        
        # Launch SAP logon
        subprocess.Popen(sap_command)
        
        # Wait for the SAP GUI to open
        time.sleep(5)  # Adjust this delay as needed
        
        # Verify SAP GUI is open
        self.qweb.verify_text("SAP Logon")
        
        # Enter credentials
        self.qweb.type_text("User", username)
        self.qweb.type_text("Password", password)
        
        # Click the logon button
        self.qweb.click_text("Log On")
        
        # Wait for the main SAP screen
        self.qweb.verify_text("SAP Easy Access", timeout=60)
        
        print("Successfully connected to SAP")

    @keyword
    def close_sap_connection(self):
        try:
            # Click on the system menu
            self.qweb.click_text("System")
            
            # Click on "Log off"
            self.qweb.click_text("Log off")
            
            # Confirm log off if a dialog appears
            if self.qweb.is_text("Yes", timeout=5):
                self.qweb.click_text("Yes")
            
            # Wait for the logon screen or for SAP to close
            self.qweb.verify_no_text("SAP Easy Access", timeout=30)
            
            print("Successfully closed SAP connection")
        except Exception as e:
            print(f"Error while closing SAP connection: {str(e)}")
            # Optionally, you can force close the SAP GUI here if the normal close fails
            # This is a more aggressive approach and should be used cautiously
            # subprocess.call(["taskkill", "/F", "/IM", "saplogon.exe"])
