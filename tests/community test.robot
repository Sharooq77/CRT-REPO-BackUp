*** Settings ***
Library        QForce
Library        QWeb
Suite Setup        OpenBrowser    about:blank   chrome




*** Keywords ***
Click First Contact And Verify
    [Documentation]    Clicks first contact and verifies the navigation
    
    # Click the first contact name
    ClickText    Name    tag=a    anchor=Name    index=1
    
    # Verify we landed on the detail page
    VerifyText    Contact Detail    timeout=20
    VerifyText    Contact Information


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

     clickelement     (//a[@data-refid="recordId" and contains(@class, 'outputLookupLink')])[1]   anchor=Account Name
   
