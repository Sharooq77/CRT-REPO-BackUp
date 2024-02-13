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
    VerifyAll                   Type,All requests,All countries,All subsegments,Status,Draft,Open
    VerifyText                  Cash disbursement requests                              anchor=2
    SetConfig                   ShadowDOM                   True
    UseModal                    On
    VerifyText                  Country                     anchor=2
    verifytext                  Code                        anchor=2
    verifyall                   Code,Business reference,Step,Task progress,Amount to disburse,Target date,Overall progress,Status
    VerifyText                  Status                      anchor=2
    ClickElement                ${Country}
    ClickElement                ${Code}
    ClickElement                ${Businessreference}
    ClickElement                ${Step}
    ClickElement               xpath=//th[contains(text(),'Task progress')]
    ClickElement                ${amount}
    ClickElement                ${Targetdate}
    ClickElement                ${Overallprogress}
    ClickElement                ${Status}


