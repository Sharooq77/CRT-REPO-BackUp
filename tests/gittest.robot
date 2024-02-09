*** Settings ***
Resource                   ../resources/common.robot
Resource                   ../resources/variable.robot
Library                    QVision
Library                    DataDriver                  reader_class=TestDataApi    name=gavi.xlsx
Suite Setup                Setup Browser
Suite Teardown             End suite

*** Variables ***
${FILE}                    FUNDAMENTALS .pdf


*** Test Cases ***
Creating A User With Data
    [Tags]                 Users
    Appstate               Home
    #Switch To Classic If Lightning                    # This line is commented out as it may not be needed in Lightning Experience
    Verify Text            Switch to Lightning Experience
    Click Item             All Tabs
    Click Text             Disbursements
    Drop Down              View:                       All
    Click Text             Go
    Click Text             ${Disbursement_Number}
    Click Text             GO To CDR
    sleep                  2
    Click Text             Dashboard
    Click Text             add
    UseModal               On
    ClickElement           ${Country}
    ClickText              ${Name}
    ClickElement           ${RecipientVendor}
    ClickText              ${Vender}
    Sleep                  2
    ClickElement           ${BusinessKey}
    ClickText              ${Key}
    ClickElement           ${ProgrammeYear}
    ClickText              ${Year}
    Click Text             Next
    UseModal               On
    # ScrollText           Amount to Disburse for this request in USD*             recognition_mode=vision
    TypeText               amountToDisburseInput       ${Amount}
    ClickText              Next
    ${FILE_PATH}           Set Variable                ${CURDIR}/Data/${FILE}
    ClickElement           ${DecisionLetter}
    ClickElement           ${SelectFile}
    Sleep                  2
    QVision.DoubleClick    Home                        anchor=desktop
    QVision.DoubleClick    suite                       anchor=ui-recorder
    QVision.DoubleClick    files
    QVision.ClickText      FUNDAMENTALS .pdf
    QVision.ClickText      Open                        anchor=Cancel
    ClickText              Upload
    sleep                  2
    ScrollText             Reason for requesting payment
    TypeText               Reason for requesting payment                           ${Request_payment}
    TypeText               Enter USD amount of COVID-related payment or enter 0    ${USD_Amount}
    ClickText              START CDR                   anchor=as Draft
    Sleep                  2
    UseModal               On
    ClickText              START CDR                   recognition_mode=vision
    Sleep                  2
    ClickText              CDR-2024-803
    ClickText              Show Less                   anchor=Country
    ClickText              1.2 Senior Country Manager                              anchor=Created on
    TypeText               Enter a comment             ${comment}
    ClickText              APPROVE