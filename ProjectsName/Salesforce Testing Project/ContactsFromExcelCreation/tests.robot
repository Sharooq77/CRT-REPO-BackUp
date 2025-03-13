*** Settings ***
Documentation            New test suite
# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                  QForce
Library                  QWeb
Library    DataDriver    reader_class=TestDataApi    name=Contacts.csv


Suite Setup              Open Browser                about:blank                 chrome
Suite Teardown           Close All Browsers
Test Template            Bulk Contacts creation

*** Test Cases ***

Bulk Contacts creation      ${Salutation}  ${FirstName}   ${LastName}  ${Phone}  ${MailingStreet}  ${MailingCity}

*** Keywords ***
Bulk Contacts creation
    [Documentation]
    [Arguments]          ${Salutation}  ${FirstName}   ${LastName}  ${Phone}  ${MailingStreet}  ${MailingCity}
    LoginToSalesforce
    LaunchApp            Sales
    ClickText            Contacts
    ClickText            New
    UseModal             ON
    PickList             Salutation                  ${Salutation}
    TypeText             First Name                  ${FirstName}
    TypeText             Last Name                   ${LastName}
    TypeText             Phone                       ${Phone}
    TypeText             Mailing Street              ${MailingStreet}
    TypeText             Mailing City                ${MailingCity}
    ClickText            Save
    Log                  Contact: ${FirstName} ${LastName} created successfully with Phone: ${Phone}
LoginToSalesforce
    [Documentation]

    GoTo                 ${url}
    TypeText             Username                    ${Username}
    TypeText             Password                    ${Password}
    ClickText            Log In
    #Check for Mfa
    ${MFA_needed}=       Run Keyword And Return Status                           Should Not Be Equal               ${None}      ${secret}
    Run Keyword If       ${MFA_needed}               FillMFA                     ${Username}          ${url}       ${secret}

FillMFA
    [Documentation]
    [Arguments]          ${Username}                 ${url}                      ${secret}
    ${MFA_Code}=         GetOtp                      ${Username}                 ${secret}            ${url}
    TypeSecret           Verification Code           ${MFA_Code}
    ClickText            Verify
    [Return]
