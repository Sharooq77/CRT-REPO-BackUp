*** Settings ***
Resource                        ../resources/common.robot
Resource                        ../resources/variable.robot
Library                         QVision
Library                         DataDriver                  reader_class=TestDataApi    name=Gaviupdate.xlsx
Suite Setup                     Setup Browser
Suite Teardown                  End suite




*** Test Cases ***
Creating And Verify to CDR request
    [Tags]                      Users
    [Documentation]             system should not enable the "START CDR" button if user is not selected the mandatory field values
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
    Click Text                  ${Year}                     #
    Click Text                  Next
    Use Modal                   On
    ScrollText                  Created by                  T Mounika
    TypeText                    amountToDisburseInput       ${Amount}
    ClickText                   Next
    #Enter the required text in the "Reason for requesting payment
    ScrollText                  Disbursement details
    ClickElement                ${STARTCDR}
    ClickElement                ${requiredDocument}
    #THIS IS FOR ONE FOLDER FILE ,IF FILE IS IN ANOTHER SUIT USE EXADIR
    ${FILE_PATH}                Set Variable                ${CURDIR}/Data/${FILE}
    Click Element               ${DecisionLetter}
    Click Element               ${SelectFile}
    #'Decision Letter'should be able to upload As a required document
    QVision.DoubleClick         Home                        anchor=desktop
    QVision.DoubleClick         suite                       anchor=ui-recorder
    QVision.DoubleClick         files
    QVision.ClickText           FUNDAMENTALS .pdf
    QVision.ClickText           Open                        anchor=Cancel
    Click Text                  Upload
    #verify the mandatory filed beforce click CDR button
    ClickElement                ${Reasonforrequestingpayment}
    Waiting
    Type Text                   Reason for requesting payment                           ${Request_payment}
    ClickElement                ${Covid19relatedpayment}
    Waiting
    Type Text                   Enter USD amount of COVID-related payment or enter 0    ${USD_Amount}
    Click Text                  START CDR                   anchor=as Draft
    Waiting
    UseModal                    On

    # Click Text                START CDR                   recognition_mode=vision
    # Waiting