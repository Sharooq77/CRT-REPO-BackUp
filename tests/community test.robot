*** Settings ***
Library        QForce
Library        QWeb
Library    ../libraries/salesforce_dropdown_handler.py
Suite Setup        OpenBrowser    about:blank   chrome






*** Test Cases ***

    open browser         https://login.salesforce.com    chrome
    TypeText    Username    sharooq.a@cloudfulcrum.com.org
    TypeSecret    Password    Abbusharuk@123
    ClickText    Log In
    
    # Wait for and verify we're logged in by checking for Home tab
    VerifyText    Home
    
    # Method 1: Using App Launcher
    LaunchApp    Sales
    ClickText    Contacts
 # Verify we're on the contacts list view

     clickelement    xpath=(//a[@data-refid="recordId" and contains(@class, 'outputLookupLink')])[1]   anchor=Account Name
   
  