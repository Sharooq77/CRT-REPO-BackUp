*** Settings ***
Resource                        ../resources/common.robot
Resource                        ../resources/variable.robot
Library                         QVision
Library                         DataDriver                  reader_class=TestDataApi    name=Gaviupdateone.xlsx
Suite Setup                     Setup Browser
Suite Teardown                  End suite



*** Test Cases ***
Creating And Verify to CDR request
    [Tags]                      CDR
    Appstate                    Home
    Switch To Classic If Lightning                          # This line is commented out as it may not be needed in Lightning Experience
    LaunchApp                   GAVI CRM
    Click Item                  All Tabs
    Click Text                  Disbursements
    Drop Down                   View:                       All
    Click Text                  Go
    #open existing CDR Record
    Click Text                  ${Disbursement_Number}
    Click Text                  GO To CDR
    Waiting
    Click Text                  Dashboard
    Click Text                  add
    Use Modal                   On
    #Verify to Create CDR with Recipient(Vendor) type as Government(MOH)
    Click Element               ${Country}
    Click Text                  ${Name}
    Click Element               ${RecipientVendor}
    Click Element               ${Vendor}
    Click Element               ${BusinessKey}
    Click Element               ${Key}
    Click Element               ${ProgrammeYear}
    Click Element               ${Year}
    Click Text                  Next
    QVision.Verifytext          CDR
    ${var}                      QVision.Get Text            CDR with
    ${CDR}                      Evaluate                    $var.split(" ")[3]
    Scroll Text                 Created by                  T Mounika
    Type Text                   amountToDisburseInput       ${Amount}
    Click Text                  Next

    #THIS IS FOR ONE FOLDER FILE ,IF FILE IS IN ANOTHER SUIT USE EXADIR
    ${FILE_PATH}                Set Variable                ${CURDIR}/Data/${FILE}
    Click Item                  Decision Letter
    Click Text                  Select a file *
    #'Decision Letter'should be able to upload As a required document
    QVision.DoubleClick         Home                        anchor=desktop
    QVision.DoubleClick         excution                    #run in dev mode use this steps
    QVision.DoubleClick         CRT-REPO
    #QVision.DoubleClick        suite                       anchor=ui-recorder
    QVision.DoubleClick         files
    QVision.ClickText           FUNDAMENTALS .pdf
    QVision.ClickText           Open                        anchor=Cancel
    Click Text                  Upload
    Waiting
    #Enter the required text in the "Reason for requesting payment
    ScrollText                  Amount to disburse for this request in USD*             recognition_mode=vision
    ClickElement                ${Reasonforrequestingpayment}
    Type Text                   Reason for requesting payment                           ${Request_payment}
    Type Text                   Enter USD amount of COVID-related payment or enter 0    ${USD_Amount}
    Click Text                  START CDR                   anchor=as Draft
    Waiting
    UseModal                    On
    Click Text                  START CDR                   recognition_mode=vision
    Wait                        2
    #Verify the SCM user should able to approve the CDR request
    ClickText                   All request
    ClickText                   My request
    Click Text                  ${CDR}
    Sleep                       2
    Verify Text                 Sudan                       anchor=2
    Verify All                  SDN-HSS-3-MOH,Government (MoH),Testing,USD 8
    Click Text                  Show Less                   anchor=Country
    Scroll Text                 1.2 Senior Country Manager                              anchor=Created on
    Type Text                   Enter a comment             ${comment}
    Scroll Text                 APPROVE
    Click Text                  APPROVE
    Waiting
    #Verify the Regional Head user should able to approve the CDR request
    Scroll Text                 Regional Head
    Click Text                  2.1 Regional Head
    Scroll Text                 Assigned
    ClickElement                ${Approve}
    Type Text                   Approver’s comment          ${comment}
    Type Text                   Reason for delay if applicable                          ${Request_payment}
    Verify Text                 MARK TASK AS COMPLETED
    Click Text                  MARK TASK AS COMPLETED
    Waiting
    SwipeUp                     2
    Verify Text                 Sent to SAP
    #check the CDR number
    ${URL}                      GetUrl
    ${number}                   Evaluate                    $URL.split("/")[6]
    GoTo                        ${CheckCDR}/${number}



