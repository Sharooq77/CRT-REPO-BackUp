*** Settings *** 
Documentation           Test to compare Variables vs Execution Parameters 
Library                 QForce 
Suite Setup             Open Browser    about:blank    chrome 
Suite Teardown          Close All Browsers 
 
 
*** Variables ***
${test_env}    ${EMPTY}

*** Test Cases *** 
Compare Variables And Parameters 
    [Documentation]     Shows difference between Variables and Execution Parameters 
    [Tags]             comparison 
     
    # Using Variable (set in Suite Details > Variables) 
    Log   ${username} 
     
    # Using Execution Parameter (set in Suite Details > Execution Parameters) 
    Log    Environment from Execution Parameter: ${TEST_ENV} 
     
    # Both work similarly in IF conditions 
    IF    '${username}' == 'test@copado.com' 
        Log    Using test user 
    END 
     
    IF    '${TEST_ENV}' == 'UAT' 
        Log    Testing in UAT 
    END 

