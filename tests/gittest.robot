*** Settings ***
Resource               ../Resources/Common.robot
Library                QWeb
Suite Setup            Setup Browser
Suite Teardown         End suite
Library                DataDriver                  reader_class=TestDataApi    name=SecureWork.xlsx
 
# #                    *** Variables ***
#                      ${ExpectedText}             "The charges reflected hereunder do not include taxes. Unless Partner has provided Secureworks Japan K.K. ("Secureworks") with a valid resale or emption certificate, \n
# Partner will be responsible for any sales, use, value-added or import taxes, customs duties or similar taxes, if applicable,
 
 
*** Test Cases ***
Entering A Lead With Data
    [Tags]             AllData
 
*** Keywords ***
    [Arguments]        ${Product1}                 ${Product2}                 ${Product3}                ${Qty1}                    ${Qty2}    ${Qty3}
    [tags]             Lead
    Appstate           Home
    LaunchApp          Sales
    ClickText          Leads
    ClickText          Select a List View: Leads
    ClickText          Partner Portal Deal Registration
    UseTable           Item Number
    Clicktext          ${Lead_Name}
    clicktext          Show more actions
    ClickText          Convert
 
    #Lead Conversion
    ClickText          Search Account              Account Search              recognition_mode=vision
    TypeText           Search Account              ${Account_Name}
    Clicktext          ${Account_Name}
    #Choosing Account
    ClickText          Choose Existing
    #Choosing Contact
    ClickText          Choose Existing             Contact Search
    TypeText           Search Contact              ${Contact_Name}
    ClickText          ${Contact_Name}
    #Choosing Opportunity
    ClickText          Choose Existing             Opportunity Search
    TypeText           Search Opportunity          ${Oppo_Name}
    ClickText          ${Oppo_Name}
    DropDown           Converted Status            Qualified                   recognition_mode=vision
    # Clicktext        Convert
    #Verifying Account, Contact and Opportunity
    ClickText          Accounts
    VerifyText         ${Account_Name}
    ClickText          Contacts
    VerifyText         ${Contact_Name}
    ClickText          Opportunities
    VerifyText         ${Oppo_Name}
 
    #Creating new quote
    ClickText          Opportunities
    ClickText          Select a List View: Opportunities
    ClickText          Recently Viewed
    TypeText           Search this list...         ${Oppo_Name}\n
    ClickText          ${Oppo_Name}                # Test
    ClickText          New Quote
    TypeText           Short Description           ${Quite_Name}
    PickList           Line of Business            ${Line_of_Business}
    PickList           Billing Frequency           ${Billing_Frequency}
    PickList           Quote Sales Team            Account Director
    ClickText          Save                        partial_match=False
    #Adding Product
    ClickText          Edit Products               # Account industry Error
    # UseTable         Action
    #ClickText         Expand All
    ClickText          Dell SafeGuard
    Clicktext          ManagedXDR OT
    #Product1
    ClickText          ${Product1}
    Verifytext         Qty
    ClickElement       xpath=//*[@id="j_id0:mainForm:QPBlock:priceTable:0:qty"]
    TypeText           Qty                         ${Qty1}                     Line Item Type             recognition_mode=vision
    #Product2
    ClickText          ${Product2}
    Verifytext         Qty
    ClickElement       xpath=//*[@id="j_id0:mainForm:QPBlock:priceTable:0:qty"]
    TypeText           Qty                         ${Qty2}                     Line Item Type             recognition_mode=vision
    #Product3
    ClickText          ${Product3}
    Verifytext         Qty
    ClickElement       xpath=//*[@id="j_id0:mainForm:QPBlock:priceTable:0:qty"]
    TypeText           Qty                         ${Qty3}                     Line Item Type             recognition_mode=vision
 
 
    ClickText          Save
    # ClickText        Save
    Clicktext          PDF
    UsePdf             QuotePDF
    SwitchBrowser      On
    ${text}            GetPdfText                  #returns whole content
    VerifyText         ${text}
    # Verify Pdf Text    text=SecureWorks            normalize=True
    # ${PDFtext}         GetPdfText                  locator=Notes               chars=100
    # Log                ${PDFtext}
    Switch Window      index=1                     delay=1
    ClickText          Approve Quote
    ClickText          Return to Quote