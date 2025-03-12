*** Settings ***

Documentation           New test suite
# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                 QForce 
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Test Cases ***

Cretate Product
    [Documentation]    Test Case created using the QEditor


    GoTo    https://simpletest3-dev-ed.develop.my.salesforce.com/
    TypeText    Username    simpletest_cpq@gmail.com
    TypeSecret    Password    SimpleTest@123!
    ClickText    Log In
    LaunchApp    Salesforce CPQ
    ClickText    Products
    ClickText    Edit List
    ClickText    Optical Cable
    ClickText    Edit
    UseModal    On
    PickList    Charge Type    One-Time
    ClickText    Save    partial_match=False
    UseModal    Off

Create Price Rule
    [Documentation]    Test Case created using the QEditor
    
    ClickText    Price Rules
    ClickText    New
    UseModal    On
    TypeText    *Price Rule Name    Grade A
    PickList    *Evaluation Scope    Configurator
    ClickCheckbox    Active    on
    PickList    Configurator Evaluation Event    Save
    PickList    Configurator Evaluation Event    Edit
    PickList    Lookup Object    IndustryPrice__c
    ComboBox    Search Products...    Optical Cable
    ClickText    Save    partial_match=False
    UseModal    Off
    ClickText    Log In
    LaunchApp    Salesforce CPQ
    ClickText    Products
    ClickText    Edit List
    ClickText    Optical Cable
    ClickText    Edit
    UseModal    On
    PickList    Charge Type    One-Time
    ClickText    Save    partial_match=False
    UseModal    Off

Update Orders

    GoTo    https://simpletest3-dev-ed.develop.my.salesforce.com/
    TypeText    Username    simpletest_cpq@gmail.com
    TypeSecret    Password    SimpleTest@123!
    ClickText    Log In
    LaunchApp    Salesforce CPQ
    ClickText    Orders
    ClickText    00000100
    ClickText    Edit
    UseModal    On
    PickList    *Status    Draft
    ClickText    Save    partial_match=False
    ClickText    Close error dialog
    ClickText    Cancel
    UseModal    Off

