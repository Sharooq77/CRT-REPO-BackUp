*** Settings ***
Library        QForce
Library        QWeb
Library        String
Library       ../libraries/salesforce_dropdown_handler.py
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
    ClickText    Accounts
    ClickText    New

    # Fill in the form using custom picklist
    TypeText    Account Name    Test Account
    Select From Custom Picklist    Type    Customer
    Select From Custom Picklist    Industry    Technology

    # For searchable picklist
    Select From Searchable Picklist    Rating    Hot

    ClickText    Save    partial_match=False

*** Keywords ***
Verify Picklist Selection
    [Arguments]    ${field}    ${expected_value}
    VerifyText    ${expected_value}
    VerifyField    ${field}    ${expected_value}

    goto   https://www.rediff.com/
   clickelement      xpath=//a[@title="Create Rediffmail Account"]
   clickelement     xpath=//label[text()='Full Name']/following::input[1]
   Typetext         Full Name         Testing
   Evaluate           random.seed()    random
   ${random_index}    Generate Random String    8    [LOWER][NUMBERS]
   TypeText         Choose a Rediffmail ID            ${random_index}    