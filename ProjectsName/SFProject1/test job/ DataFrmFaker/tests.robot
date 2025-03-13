*** Settings ***
Documentation           New test suite
Library                 QForce 
Library                 FakerLibrary
Library                 Collections
Library                 String
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Variables ***
${url}                 https://login.salesforce.com/
${UserName}            Tester@CloudF.com
${Password}            Test@12345
@{VALID_SALUTATIONS}=    Create List         Ms.    Mr.    Dr.    Mrs.    Prof.


*** Test Cases ***
Create New Lead
    ${Salutation}=      Get Random Salutation
    ${first_name}=      FakerLibrary.First Name
    ${last_name}=       FakerLibrary.Last Name
    ${company}=         FakerLibrary.Company
    CreateNewLeads      ${url}    ${UserName}    ${Password}    ${Salutation}    ${first_name}    ${last_name}    ${company}

*** Keywords ***
*** Keywords ***
Get Random Salutation
    [Documentation]    Returns a random salutation from the predefined list
    ${list_length}=    Get Length    ${VALID_SALUTATIONS}
    ${random_index}=    Evaluate    random.randint(0, ${list_length}-1)    random
    ${salutation}=     Get From List    ${VALID_SALUTATIONS}    ${random_index}
    Log    Selected Salutation: ${salutation}    # Add logging for debugging
    Should Not Be Empty    ${salutation}    # Validation
    [Return]    ${salutation}


CreateNewLeads
    [Documentation]    This test creates new CreateNewLeads
    [Arguments]       ${url}    ${UserName}    ${Password}    ${Salutation}    ${first_name}    ${last_name}    ${company}
    
     ${Salutation}=      Get Random Salutation
     Goto             ${url}
    TypeText         Username                  ${UserName}
    TypeSecret       Password                  ${Password}
    ClickText        Log In
    LaunchApp        Sales
    ClickText        Leads
    ClickText        New
    UseModal         On
    PickList         Salutation                ${Salutation}               
    TypeText         First Name               ${first_name}
    TypeText         Last Name                ${last_name}
    TypeText         Company                  ${company}
    ClickText        Save
    UseModal         Off
