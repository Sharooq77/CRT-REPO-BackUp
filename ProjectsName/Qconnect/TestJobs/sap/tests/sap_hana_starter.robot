*** Settings ***

Library                      QSapR3

*** Variables ***
${SAP_CONNECTION_STRING}     /H/gldusedv1.Releaseowl.com/S/3200                      # Replace with your actual connection string
${SAP_USERNAME}              CRT_TEST
${SAP_PASSWORD}              CRT@123

*** Test Cases ***
Connect to SAP GUI and Perform Simple Action
    [Documentation]          This test case connects to SAP GUI and performs a simple action

    # Connect to SAP system
    QSapR3.Connect           ${SAP_CONNECTION_STRING}

    # Log in to SAP
    QSapR3.Create Session
    QSapR3.TypeText          Username                    ${SAP_USERNAME}
    QSapR3.TypeText          Password                    ${SAP_PASSWORD}
    QSapR3.ClickText         Log On
