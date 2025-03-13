*** Settings ***

Documentation           New test suite
# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                 QForce 
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Variables ***
${FirstName}   Test 
${LastName}    Contact1
${Phone}    999999

*** Test Cases ***
Update Contact
    Login to Salesforce    ${Username}    ${Password}    ${url}
    Update Contact Record  ${FirstName}   ${LastName}

*** Keywords ***
Login to Salesforce
    [Documentation]
    [Arguments]    ${Username}    ${Password}    ${url}
    GoTo           ${url}
    TypeText       Username       ${Username}
    TypeText       Password       ${Password}
    ClickText      Log In

Update Contact Record
    [Documentation]
    [Arguments]    ${FirstName}   ${LastName}
    Authenticate    ${client_id}          ${client_secret}    ${username}           ${password}     sandbox=True

    # Query Contact by name
    ${results}=                 QueryRecords           SELECT id from Contact WHERE FirstName LIKE '${FirstName}'' and LastName like '${LastName}'
    # check count of found records
    ${count}=                   Set Variable           ${results}[totalSize]
    # mark test case skipped if Lead is not found
    Skip If                     ${count} == 0          ${LastName} ${LastName} could not be found!
    ${id}=                      Set Variable   ${results}[records][0][Id]
    # updating two new fields, Phone and Lead status
    UpdateRecord       Contacts                        ${id}                              Phone=${phone}

