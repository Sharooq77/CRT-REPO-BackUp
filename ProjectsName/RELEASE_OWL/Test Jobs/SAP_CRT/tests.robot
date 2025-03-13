*** Settings ***
Library                    QVision                     # For desktop automation
Library                    OperatingSystem             # For file operations
Library                    Process                     # For starting processes
Library                    QWeb                        # For web automation and screenshots
Library                    QSapR3
Library                    QS4Hana
Library                    String
Library                    DateTime
*** Variables ***
${USERNAME}                CRT_TEST                    # SAP login username
${PASSWORD}                CRT@123                     # SAP login password
${SAP_SYSTEM_NAME}         DV1 [gldusedv1.releaseowl.com]                          # SAP system to connect
${FIELD_ID}                erty
${SEARCH_VALUE}            spro
*** Keywords ***
Find SAP Logon Executable
    ${possible_paths}=     Create List                 # List of possible SAP Logon paths
    ...                    C:\\Program Files (x86)\\SAP\\FrontEnd\\SAPgui\\saplogon.exe
    ...                    C:\\Program Files\\SAP\\FrontEnd\\SAPgui\\saplogon.exe
    ...                    C:\\Program Files (x86)\\SAP\\FrontEnd\\SAPgui\\saplogon800.exe                     # SAP Logon 8.00
    ...                    C:\\Program Files\\SAP\\FrontEnd\\SAPgui\\saplogon800.exe

    FOR                    ${path}                     IN                          @{possible_paths}
        ${exists}=         Run Keyword And Return Status                           File Should Exist           ${path}                     # Check if file exists
        Run Keyword If     ${exists}                   Return From Keyword         ${path}                     # Return the first found path
    END
        
    

*** Test Cases ***
Connect to SAP
    [Documentation]        This test case launches SAP Logon 800 and connects to the SAP system

    ${SAP_PATH}=           Find SAP Logon Executable                               # Get the correct SAP Logon path

    ${process}=            Start Process               ${SAP_PATH}                 # Launch SAP Logon
    Sleep                  10s                         # Wait for SAP Logon to start
    QWeb.LogScreenshot     # Take a screenshot
    QVision.SetConfig      ocr_scale                   1.25                        # Set OCR scale for better text recognition
    QVision.ClickText      Demo
    QVision.DoubleClick    ${SAP_SYSTEM_NAME}          # Select SAP system
    QVision.TypeText       New password                ${USERNAME}                 # Enter username
    QVision.HotKey         tab                         # Move to next field
    QVision.WriteText      ${PASSWORD}                 # Enter password
    QVision.HotKey         enter                       # Submit login
    QVision.SetConfig      ocr_scale                   1.25
   
    QVision.TripleClick    Favorites
    QVision.DoubleClick    Define internal trading patner
    QVision.ClickText      New Entries
    QVision.ClickText      Company
    QVision.HotKey         tab
    ${random_string}=      Generate Random String      5    
    QVision.WriteText        ${random_string}
    QVision.TypeText       Country                     IN
    QVision.HotKey         ctrl                        s
    QVision.VerifyText     Request
    QVision.SetConfig      ocr_scale                   1.25 
    QVision.HotKey         enter
    QVision.VerifyText    Company
   
