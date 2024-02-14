*** Settings ***
Resource                        ../resources/common.robot
Resource                        ../resources/variable.robot
Library                         QVision
Library                         DataDriver                  reader_class=TestDataApi    name=Gavisheet.xlsx
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
    #Verify the following Column fields are displayed on Search results
    VerifyAll                   Type,All requests,All countries,All subsegments,Status,Draft,Open
    VerifyText                  Cash disbursement requests                              anchor=2
    SetConfig                   ShadowDOM                   True
    VerifyText                  Country                     anchor=2
    Verifytext                  Code                        anchor=2
    Verifyall                   Code,Business reference,Step,Task progress,Amount to disburse,Target date,Overall progress,Status
    VerifyText                  Status                      anchor=2
    #country values should be sorted in ascending order
    ClickElement                ${Country1}
    ClickElement                ${Country1}                 # country values should be sorted in descending order
    ClickElement                ${Code}
    ClickElement                ${Code}
    ClickElement                ${Businessreference}
    ClickElement                ${Businessreference}
    ClickElement                ${Step}
    ClickElement                ${Step}
    #amountToDisburse values should be sorted in ascending order
    ClickElement                ${amountToDisburse}
    ClickElement                ${amountToDisburse}
    ClickElement                ${Targetdate}
    ClickElement                ${Targetdate}
    ClickElement                ${Overallprogress}
    ClickElement                ${Overallprogress}
    ClickElement                ${Status}
    ClickElement                ${Status}
    #Change the filter values as Type as "My requests" value
    ClickText                   All request
    ClickText                   My request
    ClickText                   All request
    Clicktext                   All countries
    #All Countries as "Afghanistan" and Algeria
    ClickText                   Afghanistan
    ClickText                   Algeria
    ClickText                   My request
    ClickText                   All request
    ClickText                   CORE-EAP
    ClickText                   CORE-ESA
    #Status value as "Draft","Open","Sent to SAP"
    ClickText                   All request
    ClickText                   Draft
    ClickText                   Sent to SAP
    ClickText                   All request