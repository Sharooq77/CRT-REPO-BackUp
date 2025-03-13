*** Settings ***
Documentation          New test suite
Library                QForce
Library                DataDriver    reader_class=TestDataApi    file=OppData.csv
Suite Setup            Open Browser    about:blank    chrome
Suite Teardown         Close All Browsers
Test Template          Create New Opportunity

*** Test Cases ***
Create Opportunity using     ${Name}     ${Stage}    ${CloseDate}    ${Amount}
*** Keywords ***
Create New Opportunity
    [Documentation]    Creation of multiple Opportunities
    [Arguments]        ${Name}    ${Stage}    ${CloseDate}    ${Amount}
       Goto    https://login.salesforce.com/
     TypeText    Username    Tester@CloudF.com
    TypeText    Password    Test@12345
    ClickText    Log in
    
    LaunchApp    Sales
    ClickText    Opportunities
    ClickText    New
    TypeText    Opportunity Name    ${Name}
    PickList    Stage    ${Stage}
    TypeText    CloseDate    ${CloseDate}
    TypeText    Amount    ${Amount}
    ClickText    Save
