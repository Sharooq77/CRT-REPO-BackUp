*** Settings ***
Library                QWeb
Library                QForce
Suite Setup            OpenBrowser                 about:blank   @{BROWSERS}
*** Variables ***
${LOGIN_URL}           https://login.salesforce.com
${USERNAME}            trupti@practicecfc.com
${PASSWORD}            Meera@12345
@{BROWSERS}             chrome                edge       
  
*** Keywords ***
Login To Salesforce
    [Arguments]         ${browser}
    Open Browser       ${LOGIN_URL}                ${browser}
    Verify Text        Login
    Type Text          Username                    ${USERNAME}
    Type Text          Password                    ${PASSWORD}
    Click Text         Log In
    Verify Text        Home    
    Close Browser
    
*** Test Cases ***
Salesforce Login Test
    [tags]            Acconts
    [Documentation]    This test logs into Salesforce across multiple browsers
    FOR                ${browser}                  IN             @{BROWSERS}
        Run Keyword    Login To Salesforce    ${browser}
         Log                Successfully logged in using ${browser}
    END
