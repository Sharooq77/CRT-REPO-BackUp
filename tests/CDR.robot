*** Settings ***
Resource                        ../resources/common.robot
Resource                        ../resources/variable.robot
Library                         QVision
Library                         DataDriver                  reader_class=TestDataApi    name=Gavinew.xlsx
Suite Setup                     Setup Browser
Suite Teardown                  End suite



*** Test Cases ***
Creating And Verify to CDR request
    [Tags]                      Users
    Appstate                    Home
    Switch To Classic If Lightning                          # This line is commented out as it may not be needed in Lightning Experience
    Verify Text                 Switch to Lightning Experience
    Click Item                  All Tabs
    Click Text                  Disbursements
    Drop Down                   View:                       All
    Click Text                  Go
    #open existing CDR Record
    Click Text                  ${Disbursement_Number}
    Click Text                  GO To CDR
    Sleep                       2
    Click Text                  Dashboard
    Click Text                  add
    Use Modal                   On
    #Verify to Create CDR with Recipient(Vendor) type as Government(MOH)
    Click Element               ${Country}
    Click Text                  ${Name}
    Click Element               ${RecipientVendor}
    Click Text                  ${Vender}
    Sleep                       2
    Click Element               ${BusinessKey}
    Click Text                  ${Key}
    ClickElement                ${ProgrammeYear}
    Click Text                  ${Year}
    Click Text                  Next
    Use Modal                   On
    Swipe Down
    TypeText                    amountToDisburseInput       ${Amount}
    ClickText                   Next
    #THIS IS FOR ONE FOLDER FILE ,IF FILE IS IN ANOTHER SUIT USE EXADIR
    ${FILE_PATH}                Set Variable                ${CURDIR}/Data/${FILE}
    Click Element               ${DecisionLetter}
    Click Element               ${SelectFile}
    Sleep                       2
    #'Decision Letter'should be able to upload As a required document
    QVision.DoubleClick         Home                        anchor=desktop
    QVision.DoubleClick         suite                       anchor=ui-recorder
    QVision.DoubleClick         files
    QVision.ClickText           FUNDAMENTALS .pdf
    QVision.ClickText           Open                        anchor=Cancel
    Click Text                  Upload
    Sleep                       2
    #Enter the required text in the "Reason for requesting payment
    ScrollText                  Reason for requesting payment
    Type Text                   Reason for requesting payment                           ${Request_payment}
    Type Text                   Enter USD amount of COVID-related payment or enter 0    ${USD_Amount}
    Click Text                  START CDR                   anchor=as Draft
    Sleep                       2
    UseModal                    On
    Click Text                  START CDR                   recognition_mode=vision
    Sleep                       2
    #Verify the SCM user should able to approve the CDR request
    ClickText                   All requests
    ClickText                   My request
    Click Text                  CDR-2024-815
    Sleep                       2
    Verify Text                 Sudan                       anchor=2
    Verify All                  SDN-HSS-3-MOH,Government (MoH),Testing,,USD 11
    Click Text                  Show Less                   anchor=Country
    Scroll Text                 1.2 Senior Country Manager                              anchor=Created on
    Type Text                   Enter a comment             ${comment}
    Scroll Text                 APPROVE
    Click Text                  APPROVE
    #Verify the Regional Head user should able to approve the CDR request
    ScrollText                  Regional Head
    Click Text                  2.1 Regional Head
    Scroll Text                 Assigned
    Verify All                  Decision,Waiting for Decision
    Verify Text                 Waiting for Approver’s comment

