*** Settings ***
Library                         QSapR3
Library                         QWeb

*** Test Cases ***
Check SAP R3 Library and Connection
    [Documentation]             This test case verifies if QSapR3 library is available and if we can connect to SAP

    # Step 1: Try to connect to SAP
    Connect    gldusedv1.Releaseowl.com/00

Run SAP Operation
    # This is a placeholder for a simple SAP operation
    # Replace with an actual SAP operation you want to test
    ${result}=                  Run Keyword And Return Status                           VerifyText                  SAP Easy Access
    Run Keyword If              ${result}
    ...                         Log                         Successfully verified SAP Easy Access screen
    ...                         ELSE
    ...                         Log                         Could not verify SAP Easy Access screen
