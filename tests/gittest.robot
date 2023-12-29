
*** Settings ***
#Library                   QWeb
Library                    QForce
Resource                   ../resources/common.robot
Library                    QVision
Library                    Collections
Suite Setup                Open Browser                about:blank                chrome
Suite Teardown             Close All Browsers

*** Variables ***
${FILE}                    Crt image.jpg

*** Test Cases ***

    [Tags]                 Salesforce
    Run Keyword            Home
    LaunchApp              Sales
    clicktext              Account
    clicktext              New
    TypeText              *Account Name            Crt Test
    Picklist              Active                  No
    Picklist              SLA                      Gold
    clicktext             Save
    Verifytext             Notes & Attachments
    clicktext              Notes & Attachments
    ${FILE_PATH}           Set Variable                ${CURDIR}/files/${FILE}
    Log                    ${FILE_PATH}                console=true
    clicktext              Upload Files                partial_match=False
    QVision.DoubleClick    tests
    QVision.DoubleClick    Suite
    QVision.DoubleClick    files
    QVision.ClickText      Crt image.jpg
    QVision.ClickText      Open                        anchor=Cancel
    clicktext              Done
