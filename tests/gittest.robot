*** Settings ***
Resource                        ../resources/common.robot
Resource                        ../resources/variable.robot
Library                         QWeb
Library                         QVision
Library                         QForce
Suite Setup                     Setup Browser
Suite Teardown                  End suite

*** Variables ***
${FILE}                         FUNDAMENTALS .pdf


*** Test Cases ***
Creating A User With Data
    [Tags]                      Users
    Appstate                    Home
    Switch To Classic If Lightning                          # This line is commented out as it may not be needed in Lightning Experience
    Verify Text                 Switch to Lightning Experience
    Click Item                  All Tabs
    Click Text                  Disbursements
    Drop Down                   View:                       All
    Click Text                  Go
    Click Text                  CDR-2022-009
    Click Text                  GO To CDR
    Click Text                  Dashboard
    Click Text                  add
    ClickElement                   ${Country}
    ClickText                   Bolivia
    ClickElement                ${RecipientVendor}
    ClickText                   Government (MoH)
    Sleep                       2
    ClickElement                ${BusinessKey}
    ClickText                   BOL-HSS-2-MOH ($1782.03)
    ClickElement                ${ProgrammeYear}
    ClickText                   2017 ($1782.03)
    Click Text                  Next
    UseModal                    On
    # ScrollText                Amount to Disburse for this request in USD*            recognition_mode=vision
    TypeText                    amountToDisburseInput       100.00
    ClickText                   Next
    ${FILE_PATH}                Set Variable                ${CURDIR}/Data/${FILE}
    ClickElement                xpath=/html[1]/body[1]/div[3]/md-dialog[1]/md-dialog-content[1]/form[1]/md-card[1]/md-content[1]/div[2]/wizard-documents[1]/div[1]/div[1]/div[3]/div[1]/file-button[1]/button[1]
    ClickElement                xpath=/html[1]/body[1]/div[4]/md-dialog[1]/md-dialog-content[1]/div[1]/button[1]
    Sleep                       2
    QVision.DoubleClick         Home                        anchor=desktop
    QVision.DoubleClick         suite                       anchor=ui-recorder
    QVision.DoubleClick         files
    QVision.ClickText           FUNDAMENTALS .pdf
    QVision.ClickText           Open                        anchor=Cancel
    ClickText                   Upload
    sleep                       2
    ScrollText                  Reason for requesting payment
    TypeText                    Reason for requesting payment                          testing
    TypeText                    Enter USD amount of COVID-related payment or enter 0    0
    ClickText                   Start CDR                   anchor=SAVE AS DRAFT
    Sleep                       2
    UseModal                    On
    ClickText                   START CDR                   recognition_mode=vision
    ClickText                   CDR-2024-785
    ClickText                   Show Less                   anchor=Country
    ClickText                   1.2 Senior Country Manager                             anchor=Created on
    TypeText                    Enter a comment             approved
    # ClickText                   1.2 Senior Country Manager                             anchor=Created on
    # TypeText                    Enter a comment             approved
    # ClickText                   1.2 Senior Country Manager                             anchor=Created on
    # TypeText                    Enter a comment             approved
    # ClickText                   1.2 Senior Country Manager                             anchor=Created on
    # TypeText                    Enter a comment             approved
    ClickText                   APPROVE