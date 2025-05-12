*** Settings ***
Library        QForce
Library        QWeb
Library        String
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
    Select Picklist Value    Type     New Customer 

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

    goto   https://www.rediff.com/
   clickelement      xpath=//a[@title="Create Rediffmail Account"]
   clickelement     xpath=//label[text()='Full Name']/following::input[1]
   Typetext         Full Name         Testing
   Evaluate           random.seed()    random
   ${random_index}    Generate Random String    8    [LOWER][NUMBERS]
   TypeText         Choose a Rediffmail ID            ${random_index}    