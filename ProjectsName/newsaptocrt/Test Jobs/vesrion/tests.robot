*** Settings ***
Library           QSapR3


*** Variables ***
${SAP_CONNECTION_STRING}     /H/54.160.81.42/S/3200  # e.g., "001" or the full connection string
${SAP_CLIENT}     00   # e.g., "800"
${SAP_USER}       CRT_USER
${SAP_PASSWORD}   CRT@123

*** Test Cases ***
Connect to SAP GUI and Login
    [Documentation]    This test case connects to SAP GUI and performs a login
    
    # Launch SAP GUI and connect to the system
   Connect  ${SAP_CONNECTION_STRING}  
    
    # Wait for the SAP GUI login screen to appear

    
    # Enter login credentials
    TypeText    Client    ${SAP_CLIENT}
    TypeText    User     ${SAP_USER}
    TypeText    Password    ${SAP_PASSWORD}
    
    # Click the login button
    ClickText    Log On
    
  
