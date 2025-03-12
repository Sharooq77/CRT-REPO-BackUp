# *** Settings ***
# Library               SapGuiLibrary.py  
# Library                    QVision                     # For desktop automation
# Library                    OperatingSystem             # For file operations
# Library                    Process                     # For starting processes
# Library                    QWeb                        # For web automation and screenshots
# Library                    QSapR3
# Library                    QS4Hana
# Library                    String
# Library                    DateTime
# *** Variables ***
# ${USERNAME}                CRT_TEST                    # SAP login username
# ${PASSWORD}                CRT@123                     # SAP login password
# ${SAP_SYSTEM_NAME}         DV1 [gldusedv1.releaseowl.com]                          # SAP system to connect
# ${FIELD_ID}                erty
# ${SEARCH_VALUE}            spro
# ${POPUP_TIMEOUT}    3
# ${SLEEP_AFTER_ACTION}    1
# *** Keywords ***
# Find SAP Logon Executable
#     ${possible_paths}=     Create List                 # List of possible SAP Logon paths
#     ...                    C:\\Program Files (x86)\\SAP\\FrontEnd\\SAPgui\\saplogon.exe
#     ...                    C:\\Program Files\\SAP\\FrontEnd\\SAPgui\\saplogon.exe
#     ...                    C:\\Program Files (x86)\\SAP\\FrontEnd\\SAPgui\\saplogon800.exe                     # SAP Logon 8.00
#     ...                    C:\\Program Files\\SAP\\FrontEnd\\SAPgui\\saplogon800.exe

#     FOR                    ${path}                     IN                          @{possible_paths}
#         ${exists}=         Run Keyword And Return Status                           File Should Exist           ${path}                     # Check if file exists
#         Run Keyword If     ${exists}                   Return From Keyword         ${path}                     # Return the first found path
#     END





# *** Test Cases ***
# Handle SAP Popup And Set Transaction
#     [Documentation]    Handle potential OK popup and set transaction code with error handling
    
#     # Try to detect popup
#     ${popup_exists}=    Run Keyword And Return Status
#     ...    QVision.VerifyText    OK    timeout=3
    
#     # Handle popup if it exists
#     IF    ${popup_exists}
#         ${click_status}=    Run Keyword And Return Status
#         ...    QVision.ClickText    OK
#         Run Keyword If    not ${click_status}
#         ...    Log    Failed to click OK button    WARN
#         Sleep    1    # Short wait after clicking OK
#     END
    
#     # Set transaction code
#     Set SAP Element Text    wnd[0]/tbar[0]/okcd    spro
#     Sleep    3
    
#     # Verify transaction code was set
#     ${verify_status}=    Run Keyword And Return Status
#     ...    QVision.VerifyText    SPRO    timeout=5
    
#     Run Keyword If    not ${verify_status}
#     ...    Log    Transaction code might not be set properly    WARN

# *** Keywords ***
# Handle SAP Popup
#     [Documentation]    Generic keyword to handle SAP popup
    
#     ${popup_exists}=    Run Keyword And Return Status
#     ...    QVision.VerifyText    OK    timeout=3
    
#     IF    ${popup_exists}
#         QVision.ClickText    OK
#         Sleep    1
#         RETURN    ${TRUE}
#     END
#     RETURN    ${FALSE}
