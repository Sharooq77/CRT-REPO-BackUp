*** Settings ***
Library                         QForce
Library                         QWeb


*** Variables ***
# IMPORTANT: Please read the readme.txt to understand needed variables and how to handle them!!
${initial_sleep_time}           5
${BROWSER}                      chrome
${username}                     mounika.t@cloudfulcrum.com.uat
${password}                     GAVI@1234
${login_url}                    https://test.salesforce.com                             # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}                     ${login_url}/lightning/page/home
${new}                          https://gavi--uat.sandbox.my.salesforce.com
*** Keywords ***
Setup Browser
    # Setting search order is not really needed here, but given as an example
    # if you need to use multiple libraries containing keywords with duplicate names
    Set Library Search Order    QForce                      QWeb
    Open Browser                about:blank                 ${BROWSER}
    SetConfig                   DefaultTimeout              30s                         #sometimes salesforce is slow

End suite
    Close All Browsers

Login
    [Documentation]             Login to Salesforce instance
    GoTo                        ${login_url}
    TypeText                    Username                    ${username}                 delay=1
    TypeText                    Password                    ${password}
    ClickText                   Log In

Home
    [Documentation]             Navigate to homepage, login if needed
    GoTo                        ${home_url}
    ${login_status} =           IsText                      To access this page, you have to log in to Salesforce.                              2
    Run Keyword If              ${login_status}             Login


Wait And Increase Sleep Time
    [Arguments]                 ${initial_sleep_time}
    ${sleep_time}=              Evaluate                    ${initial_sleep_time} + 30 if ${initial_sleep_time} > 5 else ${initial_sleep_time}
    Sleep                       ${sleep_time}s

Switch To Classic If Lightning
    Click Text                  View profile
    ${is_lightning} =           Is Text                     Switch to Salesforce Classic                            timeout=2                   # Short timeout for quick check
    Run Keyword If              '${is_lightning}' == 'True'                             Click Text                  Switch to Salesforce Classic

Waiting
    sleep                       2