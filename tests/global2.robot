*** Settings ***
Library           QWeb

*** Test Cases ***
Access Global Variable Example
    [Documentation]    Demonstrates accessing a global variable set in another suite.
    Log    ${GLOBAL_EXAMPLE}