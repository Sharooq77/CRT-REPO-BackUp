*** Settings ***
Library    QSapR3

*** Variables ***
${SAP_CONNECTION_STRING}    /H/gldusedv1.Releaseowl.com/S/3200
${SAP_USERNAME}    CRT_TEST
${SAP_PASSWORD}    CRT@123

*** Test Cases ***
Connect to SAP GUI and Perform Simple Action
    [Documentation]    This test case connects to SAP GUI and performs a simple action

    # Connect to SAP system
    Connect    ${SAP_CONNECTION_STRING}

    # Log in to SAP
    Create Session
    Type Text    Username    ${SAP_USERNAME}
    Type Text    Password    ${SAP_PASSWORD}
    Click Item    GuiButton    sap_id=/app/con[0]/ses[0]/wnd[0]/usr/btnOK
