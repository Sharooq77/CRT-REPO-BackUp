*** Settings ***
Library                      QVision
Library                      OperatingSystem
Library                      Process
Library                      QWeb
Library                      QS4Hana

*** Variables ***
${USERNAME}                  CRT_TEST
${PASSWORD}                  CRT@123
${SAP_SYSTEM_NAME}           DV1 - SandBox ( MAINT )

*** Keywords ***
Find SAP Logon Executable
    ${possible_paths}=       Create List
    ...                      C:\\Program Files (x86)\\SAP\\FrontEnd\\SAPgui\\saplogon.exe
    ...                      C:\\Program Files\\SAP\\FrontEnd\\SAPgui\\saplogon.exe
    ...                      C:\\Program Files (x86)\\SAP\\FrontEnd\\SAPgui\\saplogon800.exe
    ...                      C:\\Program Files\\SAP\\FrontEnd\\SAPgui\\saplogon800.exe

    FOR                      ${path}                     IN                          @{possible_paths}
        ${exists}=           Run Keyword And Return Status                           File Should Exist    ${path}
        Run Keyword If       ${exists}                   Return From Keyword         ${path}
    END
    Fail                     SAP Logon executable not found in expected locations

*** Test Cases ***
Connect to SAP
    [Documentation]          This test case launches SAP Logon 800 and connects to the SAP system

    # Find SAP Logon executable
    ${SAP_PATH}=             Find SAP Logon Executable
    Log                      SAP Logon path: ${SAP_PATH}

    # Launch SAP Logon 800


    ${process}=              Start Process               ${SAP_PATH}
    Sleep                    10s                         # Wait for SAP Logon to start
    QWeb.LogScreenshot

    # Double-click on the SAP system
     QVision.SetConfig      org_scale.                1.25        detect_type=True
    QVision.DoubleClick      ${SAP_SYSTEM_NAME}
    QWeb.LogScreenshot

    # Login to SAP
    QVision.TypeText         New password                ${USERNAME}
    QVision.LogScreenshot
    QVision.HotKey           tab
    QVision.WriteText        ${PASSWORD}
    QVision.HotKey           enter
    QWeb.LogScreenshot


