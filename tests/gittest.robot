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
    TypeText                    amountToDisburseInput       ${Amount}
    ClickText                   Next
    #THIS IS FOR ONE FOLDER FILE ,IF FILE IS IN ANOTHER SUIT USE EXADIR
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
    ClickText                   CDR-2024-814
    VerifyText                  Sudan                       anchor=2
    VerifyAll                   SDN-HSS-3-MOH,Government (MoH),Testing,,USD 11
     ClickText                   Show Less                   anchor=Country
    SwipeDown                   2
#Verify the SCM user should able to approve the CDR request
    #ScrollText                  1.2 Senior Country Manager                              anchor=Created on d       delay=2
    ClickText                   1.2 Senior Country Manager                              anchor=Created on
    #ScrollText                  Assigned                    delay=2
    SwipeDown
    TypeText                    Enter a comment             ${comment}
    # ClickText                 APPROVE
    ScrollText                  Regional Head
    #Verify the Regional Head user should able to approve the CDR request
    ClickText                   2.1 Regional Head
    ScrollText                  Assigned
    VerifyAll                   Decision,Waiting for Decision
    VerifyText                  Waiting for Approver’s comment

*** Test Cases ***
Verify Email Was Successfully Sent

    [Tags]                      EmailVerification
    # Authenticate to Salesforce (replace with your actual credentials and details)
    Authenticate                client_id=your_client_id    client_secret=your_client_secret                      username=your_username    password=your_password    sandbox=True
    # Define the SOQL query to retrieve the EmailMessage record of interest. Adjust the WHERE clause as needed.
    ${query}=                   Set Variable                SELECT Id, Status FROM EmailMessage WHERE Subject='testing' AND Status='Sent' AND DAY_ONLY(MessageDate) = TODAY ORDER BY MessageDate DESC LIMIT 1
    # Execute the SOQL query
    ${results}=                 Query Records               ${query}
    Log                         ${results}
    # Verify that the query returned a result and that the Status is 'Sent'
    ${record_count}=            Get Length                  ${results}
    Should Be True              ${record_count} > 0         msg=Email with specified subject was not successfully sent.

    # ${email_query}=           Set Variable                SELECT Id, Name, Subject, FromAddress, FromName, MessageDate, Status, ToAddress FROM EmailMessage
    # ${email_results}=         Query Records               ${email_query}
    # Log                       ${email_results}