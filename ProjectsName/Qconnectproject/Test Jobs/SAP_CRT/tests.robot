# *** Settings ***
# #Library                   QS4Hana
# #Library                   QWeb
# #Library                   QSapR3
# Library                    QVision
# Library                    OperatingSystem
# Library                    Process

# *** Variables ***
# ${SAP_PATH}                Notepad.exe    #C:\\Program Files\\SAP\F\rontEnd\\SAPGUI\\saplogon.exe
# #C:\Program Files\SAP\FrontEnd\SAPGUI\saplogon.exe     #/H/gldusedv1.releaseowl.com/S/DV1        #C:\Program Files\SAP\FrontEnd\SAPGUI\saplogon.exe
# ${USERNAME}                CRT_TEST
# ${PASSWORD}                CRT@123
# ${SAP_SYSTEM_NAME}         DV1 [gldusedv1.releaseowl.com]
# *** Test Cases ***
# Connect to SAP
#     # ${normalized_path}=    Normalize Path              ${SAP_PATH}
#     # ${quoted_path}=        Set Variable                "${normalized_path}"
#     # Log                    ${quoted_path}
#     # ${ABC}                 Start Process               ${quoted_path}              shell=True

#      Run                         ${SAP_PATH}
#     #                      OpenApplication             C:\Program Files\SAP\FrontEnd\SAPGUI\saplogon.exe
#     Sleep                  30                          # Give some time for the application to start
#     #VerifyText            SAP Logon                   timeout=30

#     # QSapR3.ClickText     ${SAP_SYSTEM_NAME}
#     #OpenApplication       SAP Logon 64
#     # QS4Hana.LaunchApp    ${SAP_PATH}                 ${USERNAME}                 ${PASSWORD}
#     # QSapR3.Connect       ${SAP_PATH}                 timeout=60
#     # DoubleClick            ${SAP_SYSTEM_NAME}
#     # LogScreenshot
#     # TypeText               User                        ${USERNAME}
#     #  LogScreenshot
#     # TypeText               Password                    ${PASSWORD}
#     # LogScreenshot
#     # ClickText              Log On
#     # QWeb.LogScreenshot
#     # QSapR3.LogScreenshot
