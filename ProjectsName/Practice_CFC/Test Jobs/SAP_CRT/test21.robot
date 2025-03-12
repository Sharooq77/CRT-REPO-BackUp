

# *** Settings ***
# Library                 QWeb
# Library                 QSapR3
# Library                 QS4Hana

# *** Variables ***
# ${SAP_PATH}             C:\Program Files\SAP\FrontEnd\SAPGUI\saplogon.exe
#${SAP_CONNECTION}    DV1
#${SAP_CLIENT}    100    DV1
#${SAP_CLIENT}    100
# ${USERNAME}             CRT_TEST
# ${PASSWORD}             CRT@123
# ${TIMEOUT}              60

# *** Test Cases ***
# Connect to SAP
#     [Timeout]           ${TIMEOUT}
#     QSapR3.Connect      ${SAP_PATH}    timeout=${TIMEOUT}
      #QSAPR3.ClickText      DV1
#     QSapR3.TypeText     Username    ${USERNAME}    timeout=10
#     QSapR3.TypeText  Password    ${PASSWORD}    timeout=10
#     QSapR3.ClickText    Log On    timeout=10
 

#      #/H/gldusedv1.releaseowl.com/S/DV1        
