*** Settings ***
Documentation           Salesforce Login with MFA using Copado CRT
Library                QForce
Library                QWeb
Suite Setup            Open Browser    about:blank    chrome
Suite Teardown         Close All Browsers

*** Test Cases ***
Login TestCase
    [Documentation]
    LoginToSalesforce     ${Username}    ${Password}   ${LoginUrl}     ${secret}

*** Keywords ***
LoginToSalesforce
    [Documentation]
    [Arguments]    ${Username}    ${Password}   ${LoginUrl}     ${secret}
    GoTo           ${LoginUrl}
    TypeText       Username       ${Username}
    TypeText       Password       ${Password}
    ClickText      Log In
