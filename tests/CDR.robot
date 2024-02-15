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
    Click text                  ${Vendor}
    Click Element               ${BusinessKey}
    Click Text                  ${Key}
    ClickElement                ${ProgrammeYear}
    Click Text                  ${Year}
    Click Text                  Next
    ScrollText                  Created by                  T Mounika
    TypeText                    amountToDisburseInput       ${Amount}
    ClickText                   Next
    QVision.Verifytext          CDR
    ${var}                      QVision.Get Text            CDR with
    ${CDR}                      Evaluate                    $var.split(" ")[3]
    #THIS IS FOR ONE FOLDER FILE ,IF FILE IS IN ANOTHER SUIT USE EXADIR
    ${FILE_PATH}                Set Variable                ${CURDIR}/Data/${FILE}
    ClickItem                   Decision Letter
    ClickText                   Select a file *
    #'Decision Letter'should be able to upload As a required document
    QVision.DoubleClick         Home                        anchor=desktop
    QVision.DoubleClick         suite                       anchor=ui-recorder
    QVision.DoubleClick         files
    QVision.ClickText           FUNDAMENTALS .pdf
    QVision.ClickText           Open                        anchor=Cancel
    Click Text                  Upload
    Sleep                       2
    #Enter the required text in the "Reason for requesting payment
    ScrollText                  Recipient document guidelines
    Type Text                   Reason for requesting payment                           ${Request_payment}
    Type Text                   Enter USD amount of COVID-related payment or enter 0    ${USD_Amount}
    Click Text                  START CDR                   anchor=as Draft
    Sleep                       2
    UseModal                    On
    Click Text                  START CDR                   recognition_mode=vision
    Wait                        2
    #Verify the SCM user should able to approve the CDR request

    ClickText                   ${CDR}
    # ClickText                 My request
    # ClickElement              ${Code}
    # ClickElement              ${Code}
    # ClickElement              xpath=/html[1]/body[1]/span[1]/app[1]/div[1]/md-content[1]/x-dashboard[1]/div[1]/div[1]/disbursement-table[1]/div[1]/md-table-container[1]/table[1]/tbody[1]/tr[1]/td[2]/a[1]
    Sleep                       2
    Verify Text                 Sudan                       anchor=2
    Verify All                  SDN-HSS-3-MOH,Government (MoH),Testing,USD 11
    Click Text                  Show Less                   anchor=Country
    Scroll Text                 1.2 Senior Country Manager                              anchor=Created on
    Type Text                   Enter a comment             ${comment}
    Scroll Text                 APPROVE
    ClickText                   APPROVE

    #Verify the Regional Head user should able to approve the CDR request
    ScrollText                  Regional Head
    Click Text                  2.1 Regional Head
    Scroll Text                 Assigned
    ClickElement                ${Approve}
    Type Text                   Approver’s comment          ${comment}
    Type Text                   Reason for delay if applicable                          ${Request_payment}
    VerifyText                  MARK TASK AS COMPLETED
    ClickText                   MARK TASK AS COMPLETED
    SwipeUp                     2
    VerifyText                  Sent to SAP
    ${URL}                      GetUrl
    ${number}                   Evaluate                    $URL.split("/")[6]
    GoTo                        ${CheckCDR}/${number}
*** Test Cases ***
Browser open     https://outlook.office.com                              chrome
    Type Text                   Email, phone, or Skype      ${username}
    Click Text                  Next
    Type Secret                 Enter password              ${password}
    Click Text                  Sign in
    Click Text                  Yes

    # Wait for the inbox to load and open the email containing the authentication code
    Verify Text                 Inbox
    TypeText                    Search                      Testing Gavi
    Click Text                  Testing Gavi