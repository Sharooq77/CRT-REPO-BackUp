*** Settings ***
# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                       QForce
Library                       FakerLibrary
Library                       DateTime
Resource                      ../Resources/Variables.robot                      

*** Keywords ***
LoginToSalesforce
    [Documentation]           This testcase lets us login into Salesforce
    Goto                      ${url}
    TypeText                  Username                    ${username}
    TypeSecret                password                    ${password}
    #ClickText                Log In
    ClickElement              xpath=//*[@id='Login']
AccountCreation
    [Documentation]           As an User, I should be able to create account and store infromation about customers or indiviuals that we do bussiness with.
    ${AccName}=               FakerLibrary.Company
    ${BillingStreet}=         FakerLibrary.Street Name
    ${BillingCity}=           FakerLibrary.City
    ${BillingCountry}=        FakerLibrary.Country
    ${BillingZip}=            FakerLibrary.Postcode
    ${AccSLASerialNumber}=    FakerLibrary.Credit Card Number
    LaunchApp                 Sales
    ClickText                 Accounts
    ClickText                 New
    UseModal                  On
    TypeText                  Account Name                ${AccName}
    PickList                  Active                      ${AccActive}
    TypeText                  Billing Street              ${BillingStreet}
    TypeText                  Billing City                ${BillingCity}
    TypeText                  Billing Zip/Postal Code     ${BillingZip}
    TypeText                  Billing State/Province      ${BillingState}
    TypeText                  Billing Country             ${BillingCountry}
    PickList                  SLA                         ${AccSLA}
    TypeText                  SLA Expiration Date         ${AccSLAExpDate}
    TypeText                  SLA Serial Number           ${AccSLASerialNumber}
    ClickText                 Save                        anchor=2
    VerifyText                ${AccName}


UpdateAccount
    [Documentation]           Repeat above test case by filling only "shipping address"

    ClickText                 Details                     # Make sure we're on Details tab
    ClickText                 Edit Shipping Address
    UseModal                  Off
    UseModal                  On
    TypeText                  Shipping Street             ${BillingStreet}
    TypeText                  Shipping City               ${BillingCity}
    TypeText                  Shipping Zip/Postal Code    ${BillingZip}
    TypeText                  Shipping State/Province     ${BillingState}
    TypeText                  Shipping Country            ${BillingCountry}
    ClickText                 Save
    UseModal                  Off
    VerifyText                ${BillingStreet}

Update Account with different address
    [Documentation]           Repeat above test case by filling only "shipping address"
    ${ShippingStreet}=        FakerLibrary.Street Name
    ${ShippingCity}=          FakerLibrary.City
    ${ShippingCountry}=       FakerLibrary.Country
    ${ShippingZip}=           FakerLibrary.Postcode
    ${BillingStreet}=         FakerLibrary.Street Name
    ${BillingCity}=           FakerLibrary.City
    ${BillingCountry}=        FakerLibrary.Country
    ${BillingZip}=            FakerLibrary.Postcode
    ClickText                 Details                     # Make sure we're on Details tab
    ClickText                 Edit Shipping Address
    UseModal                  Off
    UseModal                  On
    TypeText                  Shipping Street             ${ShippingStreet}
    TypeText                  Shipping City               ${ShippingCity}
    TypeText                  Shipping Zip/Postal Code    ${ShippingZip}
    TypeText                  Shipping State/Province     ${ShippingState}
    TypeText                  Shipping Country            ${ShippingCountry}
    TypeText                  Billing Street              ${BillingStreet}
    TypeText                  Billing City                ${BillingCity}
    TypeText                  Billing Zip/Postal Code     ${BillingZip}
    TypeText                  Billing State/Province      ${BillingState}
    TypeText                  Billing Country             ${BillingCountry}
    ClickText                 Save
    UseModal                  Off
    VerifyText                ${BillingStreet}
    VerifyText                ${ShippingStreet}

Update Existing Account
    [Documentation]           As an User, I should be able to Update existing account and update infromation about customers or indiviuals that we do bussiness with.
    ${Phone}=                 FakerLibrary.Phone Number
    ${AccNumber}=             FakerLibrary.Random Number
    LaunchApp                 Sales
    ClickText                 Accounts
    TypeText                  Search this list            ${AccountName}
    ClickText                 ${AccountName}
    ClickText                 Details
    ClickText                 Edit Phone
    TypeText                  Phone                       ${Phone}
    TypeText                  Account Number              ${AccNumber}
    ClickText                 Save
    VerifyText                ${Phone}
    VerifyAny                 ${AccNumber}

Delete Existing Account
    [Documentation]           As an User, I should be able to delete existing account.
    ${Phone}=                 FakerLibrary.Phone Number
    ${Email}=                 FakerLibrary.Email
    LaunchApp                 Sales
    ClickText                 Accounts
    TypeText                  Search this list            ${AccountName}
    ClickText                 ${AccountName}
    ClickText                 Show more actions
    ClickText                 Delete
    ClickText                 Delete

Change Owner of the Account
    [Documentation]           Change Owner of the Account
    LaunchApp                 Sales
    ClickText                 Accounts
    TypeText                  Search this list            Acosta Group
    ClickText                 Acosta Group
    ClickText                 Show more actions
    ClickText                 Change Owner
    TypeText                  Select New Owner            Account User1
    ClickText                 Account User1
    ClickText                 Submit
    VerifyText                Account User1

Share Account
    [Documentation]           Share                       Account
    ${Phone}=                 FakerLibrary.Phone Number
    ${Email}=                 FakerLibrary.Email
    LaunchApp                 Sales
    ClickText                 Accounts
    TypeText                  Search                      ${AccountName}
    ClickText                 ${AccountName}
    ClickText                 Show more actions
    ClickText                 Sharing
    TypeText                  Search                      ${newOwner}
    ClickText                 ${newOwner}
    ClickText                 Save

Import Account
    [Documentation]           Import Account
    ${Phone}=                 FakerLibrary.Phone Number
    ${AccNumber}=             FakerLibrary.Random Number
    LaunchApp                 Sales
    ClickText                 Accounts
    ClickText                 Import
    ClickText                 Accounts and Contacts
    ClickText                 Add new Records
    ClickText                 CSV
    ClickText                 Choose File
    ClickText                 Desktop
    ClickText                 Account1.csv
    ClickText                 Next
    ClickText                 Next
