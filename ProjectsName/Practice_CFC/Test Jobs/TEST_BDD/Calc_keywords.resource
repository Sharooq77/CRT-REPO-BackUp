*** Settings ***
Library         Calculator.py

*** Keywords ***
Given The Calculator Is Running
    Log    Opening Calculator
    Start Calculator

When User Enters The Term "${term}"
    Log    Entering     ${term}
    Set Test Variable    ${term}

And User Triggers The Calculation
    Log    Triggering Calculation
    ${result}    Calculate Term    ${term}
    Set Test Variable   ${result}
    
Then The Result Should Be "${expected}"
    Log    Checking Result
    Should Be Equal As Numbers    ${result}    ${expected}
