
*** Settings ***
#Library                   QWeb
Library                    QForce
Resource                   ../resources/common.robot
Library                    QVision
Library                    Collections
Suite Setup                Open Browser                about:blank                chrome
Suite Teardown             Close All Browsers

*** Variables ***
${FILE}                   FUNDAMENTALS .pdf

*** Test Cases ***

    [Tags]                 Salesforce
    Run Keyword            Home
    LaunchApp              Sales
    clicktext              Account
    clicktext             testing
    Verifytext            Notes & Attachments
    clicktext              Notes & Attachments
    ${FILE_PATH}           Set Variable                ${CURDIR}/files/${FILE}
    Log                    ${FILE_PATH}                console=true
    clicktext             Upload Files                partial_match=False
    QVision.DoubleClick    tests
    QVision.DoubleClick    files
    QVision.ClickText     FUNDAMENTALS .pdf
    QVision.ClickText      Open                        anchor=Cancel
    clicktext              Done
