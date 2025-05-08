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
   Launch App    Sales
    ClickText    Opportunities
    ClickText    New
    UseModal    on

    TypeText    Opportunity Name    Big Deal
    Select Picklist Value    Stage    Prospecting
    Select Picklist Value    Type    New Business

    # Handle dependent picklists
    Select Dependent Picklist Values    
    ...    Product Family    Hardware
    ...    Product    Laptop

    # Multi-select products
    Select Multiple Picklist Values    Additional Products    
    ...    Monitor    
    ...    Keyboard    
    ...    Mouse

    ClickText    Save
    UseModal    off

    # Verify the selections
    ${stage_correct}=    Verify Picklist Options    Stage    Prospecting
    Should Be True    ${stage_correct}