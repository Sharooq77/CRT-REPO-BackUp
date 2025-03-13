*** Settings ***
Documentation       Test suite for Salesforce Contact creation functionality
Library             QForce
Suite Setup         Open Browser    about:blank    chrome
Suite Teardown      Close All Browsers

*** Variables ***
${FIRST_NAME}      Test     
${LAST_NAME}       Contact2
${PHONE}           526219
${STREET}          TestStreet2

*** Test Cases ***
Salesforce Contact Creation Flow
    [Documentation]    Creates a new contact in Salesforce and verifies the creation
    [Tags]             contact    regression    smoke
    Login To Salesforce
    Create New Contact
   

*** Keywords ***
Login To Salesforce
    [Documentation]    Logs into Salesforce instance using provided credentials
    GoTo              ${url}
    TypeText          Username                 ${USERNAME}
    TypeSecret        Password                 ${PASSWORD}
    ClickText         Log In
    ${MFA_needed}=       Run Keyword And Return Status          Should Not Be Equal    ${None}       ${secret}
    Run Keyword If       ${MFA_needed}               Fill MFA   ${Username}         ${secret}    ${url}   

Fill MFA
    [Documentation]      Gets the MFA OTP code and fills the verification dialog (if needed)
    [Arguments]          ${Username}    ${secret}  ${LoginUrl}
    ${mfa_code}=         GetOTP    ${Username}   ${secret}   ${LoginUrl}  
    TypeSecret           Verification Code       ${mfa_code}  
    ClickText            Verify 
    [Return]
    

Create New Contact
    [Documentation]    Creates a new contact with basic information
    LaunchApp         Sales
    ClickText         Contacts
    ClickText         New
    UseModal          On
    PickList          Salutation              Mr.
    TypeText          First Name              ${FIRST_NAME}
    TypeText          Last Name               ${LAST_NAME}
    TypeText          Phone                   ${PHONE}
    TypeText          Mailing Street          ${STREET}
    ClickText         Save                    partial_match=False
    UseModal          Off

