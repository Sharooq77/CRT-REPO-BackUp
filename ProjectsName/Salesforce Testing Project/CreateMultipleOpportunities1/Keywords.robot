*** Settings ***
Library    QForce


*** Keywords ***
Login to Salesforce
    [Documentation]    Login to salesforce application
    Set Library Search Order                          QWeb                   QForce
    GoTo               ${Loginurl}
    Typetext           Username                        ${Username}
    TypeText           Password                        ${Password}
    ClickText          Log in
        # Check if MFA is needed and handle it
    
    ${otp}= GetOTP    ${Username}    ${Secret}    ${Loginurl}
    TypeText    Code    ${otp}
            ClickText    Verify


Launch Sales application
    [Documentation]    launch sales application
    LaunchApp          Sales

Goto Opportunities tab
    ClickText    Opportunities


Create new Opportunity
    [Documentation]    Creates a Opportunity record
    [Arguments]        ${opp_name}
    Goto Opportunities tab
    Clicktext          New
    UseModal           On
    TypeText           Opportunity Name        ${opp_name}
    ClickText          Close Date              
    ClickText          19
    PickList           Stage                   Prospecting
    ClickText          Save   
    ClickText          Cancel        
