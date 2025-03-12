*** Settings ***
Library    QWeb
Library    QS4Hana
Library    SAPConnection.py

*** Variables ***
${SAP_PATH}    /H/gldusedv1.releaseowl.com/S/DV1
${USERNAME}    CRT_TEST
${PASSWORD}    CRT@123
${TIMEOUT}     60  # Global timeout in seconds
*** Test Cases ***
Connect to SAP and Perform Actions
    Connect To SAP    ${SAP_PATH}    ${USERNAME}    ${PASSWORD}
     Log    Successfully connected to SAP
   
    [Teardown]    Run Keyword And Ignore Error    Close SAP Connection

*** Keywords ***
Connect To SAP
    [Arguments]    ${sap_path}    ${username}    ${password}
    Connect To Sap    ${sap_path}    ${username}    ${password}

Close SAP Connection
    Close Sap Connection    
