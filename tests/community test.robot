*** Settings ***
Library        QForce
Library        QWeb
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
    VerifyText    Recent Contacts    timeout=20
    
    # Store current URL for verification
    ${before_url}=    GetUrl
    
    # Ensure list is loaded and has records
    ${contacts_exist}=    IsText    Name    timeout=5  anchor=Account Name 
    Run Keyword If    ${contacts_exist}    Click First Contact And Verify
    ...    ELSE    Log    No contacts found in the list    WARN

*** Keywords ***
Click First Contact And Verify
    [Documentation]    Clicks first contact and verifies the navigation
    
    # Click the first contact name
    ClickText    Name    tag=a    anchor=Name    index=1
    
    # Verify we landed on the detail page
    VerifyText    Contact Detail    timeout=20
    VerifyText    Contact Information