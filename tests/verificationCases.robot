*** Settings ***
Resource                   ../resources/common.robot
Resource                   ../resources/variable.robot
Library                    QVision
Library                    DataDriver                  reader_class=TestDataApi    name=Gaviupdate.xlsx
Suite Setup                Setup Browser
Suite Teardown             End suite


*** Test Cases ***
Creating And Verify to CDR request
    [Tags]                 Users
    Run Keyword            Login
    # Switch To Classic If Lightning                   # This line is commented out as it may not be needed in Lightning Experience
    Verify Text            Switch to Lightning Experience
    Click Item             All Tabs
    Click Text             Disbursements
    Drop Down              View:                       All
    Click Text             Go
    #open existing CDR Record
    Click Text             ${Disbursement_Number}
    Click Text             GO To CDR
    Sleep                  2
    Click Text             Dashboard
    Click Text             add
    Use Modal              On
    #Verify to Create CDR with Recipient(Vendor) type as Government(MOH)
    Click Element          ${Country}
    Click Text             ${Name}
    Click Element          ${RecipientVendor}
    Click Text             ${Vender}
    Sleep                  2
    Click Element          ${BusinessKey}
    Click Text             ${Key}
    ClickElement           ${ProgrammeYear}
    Click Text             ${Year}                     #
    Click Text             Next
    Use Modal              On
    ScrollText             Created by                  T Mounika
    TypeText               amountToDisburseInput       1000001
    VerifyText             Is the intended funds recipient listed in latest GMR ?
    ClickElement           xpath=//body/div[3]/md-dialog[1]/md-dialog-content[1]/form[1]/md-card[1]/md-content[1]/disbursement-details[1]/div[1]/form[1]/div[1]
    ClickElement           xpath=//body/div[3]/md-dialog[1]/md-dialog-content[1]/form[1]/md-card[1]/md-content[1]/disbursement-details[1]/div[1]/form[1]/div[2]
    ClickText              Next
    ClickElement           xpath=//body/div[3]/md-dialog[1]/md-dialog-content[1]/form[1]/md-card[1]/md-content[1]/div[2]/wizard-documents[1]/div[1]/div[1]/div[2]/div[1]/file-button[1]/button[1]
    Click Element          xpath=//button[@id='attach-uploadButton']
    ${FILE_PATH}           Set Variable                ${CURDIR}/Data/${FILE}
    QVision.DoubleClick    Home                        anchor=desktop
    QVision.DoubleClick    suite                       anchor=ui-recorder
    QVision.DoubleClick    files
    QVision.ClickText      FUNDAMENTALS .pdf
    QVision.ClickText      Open                        anchor=Cancel
    Click Text             Upload
    sleep                  2
    Click Element          ${DecisionLetter}
    Click Element          ${SelectFile}
    Sleep                  2
    ${FILE_PATH}           Set Variable                ${CURDIR}/Data/${FILE}
    # #'Decision Letter'should be able to upload As a required document
    QVision.DoubleClick    Home                        anchor=desktop
    QVision.DoubleClick    suite                       anchor=ui-recorder
    QVision.DoubleClick    files
    QVision.ClickText      FUNDAMENTALS .pdf
    QVision.ClickText      Open                        anchor=Cancel
    Click Text             Upload
    Waiting
    SwipeDown
    ScrollText             GMR status report: where relevant
    VerifyText             Reason for requesting payment
    Waiting
    Type Text              Reason for requesting payment                           ${Request_payment}
    VerifyText             Enter USD amount of COVID-related payment or enter 0
    Waiting
    Type Text              Enter USD amount of COVID-related payment or enter 0    ${USD_Amount}
    Waiting
    # VerifyText             START CDR                   anchor=as Draft
    Click Text             START CDR                   anchor=as Draft
    Waiting
    UseModal               On
    Type Text              Enter USD amount of COVID-related payment or enter 0    ${USD_Amount}
    Waiting
    # VerifyText           START CDR                   anchor=as Draft
    Click Text             START CDR                   anchor=as Draft
    Waiting
    UseModal               On

    Click Text             START CDR                   recognition_mode=vision
    Waiting

    Click Text             Dashboard
    ClickText              All countries
    ClickText              Niger
    ClickText              Filters

    VerifyText             CDR-2024-814
    Click Text             CDR-2024-814                partial_match=Flase
    Sleep                  2
    Scroll Text            1.2 Senior Country Manager                              anchor=Created on
    ClickText              1.2 Senior Country Manager

    VerifyText             Approver’s comment
    VerifyText            Approved





    Type Text              Enter a comment             ${comment}
    Scroll Text            APPROVE
    ClickText              APPROVE

    Verify Text            Sudan                       anchor=2
    Verify All             SDN-HSS-3-MOH,Government (MoH),Testing,,USD 11
    Click Text             Show Less                   anchor=Country
    Scroll Text            1.2 Senior Country Manager                              anchor=Created on
    Type Text              Enter a comment             ${comment}
    Scroll Text            APPROVE
    Click Text             APPROVE
