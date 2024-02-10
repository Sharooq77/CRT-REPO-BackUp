*** Settings ***
Resource                        ../resources/common.robot
Resource                        ../resources/variable.robot
Library                         QVision
Library                         DataDriver                  reader_class=TestDataApi    name=Gavinew.xlsx
Suite Setup                     Setup Browser
Suite Teardown                  End suite

# *** Variables ***
# ${FILE}                       FUNDAMENTALS .pdf


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
    Click Text                  ${Disbursement_Number}
    Click Text                  GO To CDR
    sleep                       2
    Click Text                  Dashboard
    Click Text                  add
    UseModal                    On
    #Verify to Create CDR with Recipient(Vendor) type as Government(MOH)
    ClickElement                ${Country}
    ClickText                   ${Name}
    ClickElement                ${RecipientVendor}
    ClickText                   ${Vender}
    Sleep                       2
    ClickElement                ${BusinessKey}
    ClickText                   ${Key}
    ClickElement                ${ProgrammeYear}
    ClickText                   ${Year}
    Click Text                  Next
    UseModal                    On
    Swipe Down
    # ScrollText                Amount to Disburse for this request in USD*             recognition_mode=vision
    TypeText                    amountToDisburseInput       ${Amount}
    ClickText                   Next
    ${FILE_PATH}                Set Variable                ${CURDIR}/Data/${FILE}
    ClickElement                ${DecisionLetter}
    ClickElement                ${SelectFile}
    Sleep                       2
    #'Decision Letter'should be able to upload As a required document
    QVision.DoubleClick         Home                        anchor=desktop
    QVision.DoubleClick         suite                       anchor=ui-recorder
    QVision.DoubleClick         files
    QVision.ClickText           FUNDAMENTALS .pdf
    QVision.ClickText           Open                        anchor=Cancel
    ClickText                   Upload
    sleep                       2
    #Enter the required text in the "Reason for requesting payment
    ScrollText                  Reason for requesting payment
    TypeText                    Reason for requesting payment                           ${Request_payment}
    TypeText                    Enter USD amount of COVID-related payment or enter 0    ${USD_Amount}
    ClickText                   START CDR                   anchor=as Draft
    Sleep                       2
    UseModal                    On
    ClickText                   START CDR                   recognition_mode=vision
    Sleep                       2
    RefreshPage
    #Verify the SCM user should able to approve the CDR request
    ClickText                   CDR-2024-813
    ClickText                   Show Less                   anchor=Country
    Scroll To                   CDR process steps
    ClickText                   1.2 Senior Country Manager                              anchor=Created on
    TypeText                    Enter a comment             ${comment}
    ClickText                   APPROVE
    VerifyText                  Sudan                       anchor=2
    VerifyAll                   Testing,USD 11,Government (MoH),SDN-HSS-3-MOH
*** Test Cases ***
Creating 
    [Tags]                      mail
    ${email_query}=             Set Variable                SELECT Id, Name, Subject, FromAddress, FromName, MessageDate, Status, ToAddress FROM EmailMessage
    ${email_results}=           Query Records               ${email_query}
    Log                         ${email_results}