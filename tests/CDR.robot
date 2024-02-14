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
    ScrollText                  Created by                  T Mounika
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
    Wait                        2
    #Verify the SCM user should able to approve the CDR request
    ClickText                   All requests
    ClickText                   My request
    VerifyText                  CDR-2024-841
    Click Text                  CDR-2024-841             
    Sleep                       2
    Verify Text                 Sudan                       anchor=2
    Verify All                  SDN-HSS-3-MOH,Government (MoH),Testing,,USD 11
    Click Text                  Show Less                   anchor=Country
    Scroll Text                 1.2 Senior Country Manager                              anchor=Created on
    Type Text                   Enter a comment             ${comment}
    Scroll Text                 APPROVE
    ClickText                   APPROVE
    #Verify the Regional Head user should able to approve the CDR request
    ScrollText                  Regional Head
    Click Text                  2.1 Regional Head
    Scroll Text                 Assigned
    ClickElement                xpath=//body/span[@id='j_id0:j_id2']/app[1]/div[1]/md-content[1]/x-cdr-container[1]/div[1]/md-content[1]/md-tabs[1]/md-tabs-content-wrapper[1]/md-tab-content[1]/div[1]/md-content[1]/cdr-outcomes[1]/div[1]/form[1]/md-content[1]/div[2]/collapsable-card[1]/md-card[1]/md-card-content[1]/div[1]/div[3]/div[1]/v-accordion[1]/v-pane[1]/v-pane-content[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/md-radio-group[1]/md-radio-button[1]/div[1]/div[1]
    ClickText                   Approve                     recognitation_mode=vision
    Verify All                  Decision,Waiting for Decision
    Verify Text                 Waiting for Approver’s comment


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