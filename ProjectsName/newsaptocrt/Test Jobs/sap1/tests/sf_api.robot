*** Settings ***
Library    QSapR3

*** Variables ***
${SAP_CONNECTION_STRING}    /H/gldusedv1.releaseowl.com/S/DV1
# ${SAP_PATH}    C:\\Program Files\\SAP\\FrontEnd\\SAPGUI\\saplogon.exe
${SAP_USERNAME}    CRT_TEST
${SAP_PASSWORD}    CRT@123

*** Test Cases ***
Connect to SAP GUI
    # CreateSession    ${SAP_PATH}
    Connect    ${SAP_CONNECTION_STRING}
    TypeText    USER    ${SAP_USERNAME}
    TypeText    PASSWORD    ${SAP_PASSWORD}
    PressKey    Window    {ENTER}
    # Add a verification step here, e.g.:
    # VerifyText    SAP Easy Access    timeout=30
