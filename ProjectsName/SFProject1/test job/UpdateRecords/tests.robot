*** Settings ***

Documentation           New test suite
# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                 QForce 
                 
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Test Cases ***
    Authenticate     ${client_id}   ${client_secret}   ${Username}    ${password}

    ${results}=     QueryRecords       SELECT id,name from Contact WHERE name LIKE 'John%' 
# add id from first result object to a variable 
    ${ID}=          Set Variable       ${results}[records][0][Id] 
     Update    Record    Lead    FirstName=abc    WHERE    ID=${ID}

 

 
