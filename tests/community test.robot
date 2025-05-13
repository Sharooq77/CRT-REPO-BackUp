*** Settings ***
Library    QForce
Library    QWeb
Library    String
Library    ../libraries/salesforce_dropdown_handler.py    AS    SFDropdown
Suite Setup    Open Browser    about:blank    chrome






*** Test Cases ***
    Test Picklist Selection With Logging
    [Documentation]    Test picklist selection with detailed logging
    ${status}=    Run Keyword And Return Status
    ...    SFDropdown.Select From Custom Picklist    Type    Customer
    Run Keyword If    not ${status}    Log    Selection failed    WARN

    # Check logs
    ${log_contents}=    Get File    automation.log
    Log    ${log_contents}
    open browser                https://login.salesforce.com                            chrome
    TypeText                    Username                    sharooq.a@cloudfulcrum.com.org
    TypeSecret                  Password                    Abbusharuk@123
    ClickText                   Log In

    # Wait for and verify we're logged in by checking for Home tab
    VerifyText                  Home

    # Method 1: Using App Launcher
    LaunchApp                   Sales
    ClickText                   Accounts
    ClickText                   New

    # Fill in the form using custom picklist
    TypeText                    Account Name                Test Account
   SFDropdown.Select From Custom Picklist    Type    Customer
    SFDropdown.Select From Custom Picklist    Industry    Technology
    SFDropdown.Select From Searchable Picklist    Rating    Hot
    ClickText    Save    partial_match=False

              ${expected_value}

    goto                        https://www.rediff.com/
    clickelement                xpath=//a[@title="Create Rediffmail Account"]
    clickelement                xpath=//label[text()='Full Name']/following::input[1]
    Typetext                    Full Name                   Testing
    Evaluate                    random.seed()               random
    ${random_index}             Generate Random String      8                           [LOWER][NUMBERS]
    TypeText                    Choose a Rediffmail ID      ${random_index}