*** Settings ***

Documentation           New test suite
# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                 QForce 
Resource                Keywords.robot

Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers
*** Variables ***

${OpportunityPrefix}    Test_Opp_
*** Test Cases ***
Opportunities creation testcase
    Login to Salesforce

    Launch Sales application

    Goto Opportunities tab
    FOR  ${i}      IN    1     2     3
    ${number}=    Evaluate    ${i} + 1
    ${opp_name}=        Set Variable    ${OpportunityPrefix}${number}
        Create new Opportunity          ${opp_name}
    END
    
