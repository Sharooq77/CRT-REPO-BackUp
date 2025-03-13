# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Documentation             Template suite for SAP S/4HANA automation
Resource                  ../resources/common.resource
Suite Setup               Setup Browser
Suite Teardown            End Suite


*** Variables ***
${sold_to_party}          17100001
${ship_to_party}          17100001
${material}               TG11


*** Test Cases ***

Create Sales Quotation
    [Documentation]       Basic example on navigating to specific SAP module and interacting with elements
    [tags]                Sales Quotation
    Appstate              Home
    LaunchApp             Sales - Quotation Processing                            Manage Sales Quotations
    ClickText             Create Quotation

    # Type "QT" into "Quotation Type" field and press ENTER (\n)
    TypeText              Quotation Type              QT\n

    # Fill in Sold-to Party and Ship-to Party using variables.
    TypeText              Sold-to Party               ${sold_to_party}\n
    TypeText              Ship-to Party               ${ship_to_party}\n          delay=2                     # wait few seconds for previous field to update
    TypeText              Valid To                    22.12.2022                  delay=2
    TypeTable             Material                    1                           ${material}
    TypeTable             Order Quantity              1                           5
    ClickText             Save

    # Verify that loading is done by checking that input fields are cleared
    VerifyInputValue      Sold-to Party               ${EMPTY}

    # Get id of saved quotation from note area in status/toolbar
    # we are using attribute role="note" here
    # Also getting just the id between "Quotation" and "has been saved"
    ${quotation_id}=      GetText                     note                        tag=div                     between=Quotation???has been saved

    # Make the variable available to all test cases in the suite
    Set Suite Variable    ${quotation_id}

    # Navigate back to home
    ClickText             Exit
    ClickItem             Company Logo


Change Sales Quotation
    [Documentation]       Find previously created quotation and modify it
    [tags]                Sales Quotation
    Appstate              Home
    LaunchApp             Sales - Quotation Processing                            Manage Sales Quotations
    VerifyText            Create Quotation            # waiting for label to appear

    TypeText              Sales Quotation             ${quotation_id}
    ClickText             Go

    # Verify that sold-to-party value will become visible
    VerifyText            ${sold_to_party}

    # Open quotation for editing
    ClickText             ${quotation_id}
    ClickText             Change Sales Quotations

    # Change quantity value
    TypeTable             Order Quantity              1                           10

    # Save
    ClickText             Save
    VerifyText            Quotation ${quotation_id} has been saved                timeout=45
    ClickText             Exit

    # Navigate back, this time done a bit differently as an alternative example
    # i.e. clicking link (a tag) with text/title "Back"
    ClickItem             Back                        tag=a



Reject Sales Quotation
    [Documentation]       Find previously created quotation and modify it
    [tags]                Sales Quotation
    Appstate              Home
    LaunchApp             Sales - Quotation Processing                            Manage Sales Quotations
    VerifyText            Create Quotation            # waiting for label to appear

    TypeText              Sales Quotation             ${quotation_id}
    ClickText             Go

    # Verify that sold-to-party value will become visible
    VerifyText            ${sold_to_party}

    # Click radio button
    ClickItem             radio                       tag=div

    # Reject all and reject reason
    ClickText             Reject All Items
    VerifyText            Reason for Rejection
    # We have to use clickitem and clicktext here as this is not a "real" dropdown
    # with <select> and <option> tags
    ClickItem             sapMSltArrow                tag=span
    ClickText             Rejected by Customer
    ClickText             OK

    # Open "Overall Status" amd check that everything is rejected
    VerifyNoText          OK                          #                           Verify that "OK" text disappears
    ClickText             Completed
    # Using this as an example how to use our computer vision engine, since the
    # actual text is different than what is displayed ("Every&shy;­thing Rejected")
    VerifyText            Everything Rejected         recognition_mode=vision
    ClickText             OK
 



    # Navigate back, this time done a bit differently as an alternative example
    # i.e. clicking link (a tag) with text/title "Back"
    ClickItem             Back                        tag=a


Tiles Example
    [Documentation]       Example of reading information from tiles and interacting with them
    [tags]                Tiles                       Groups
    Appstate              Home
    OpenGroup             Sales Orders

    Sleep                 3                           # give tiles time to load, sometimes it takes a while
    ${orders}=            GetTileValue                Manage Sales Orders         # Get value from a tile
    VerifyTileValue       Manage Sales Orders         ${orders}
    # Verifies subitem from a graph in tile
    ${delivery_issue}=    GetTileValue                Sales Order Fulfillment     label=Delivery Issue in
    ${journal}=           GetTileValue                Sales Order Fulfillment     label=No Journal Entry
    VerifyTileValue       Sales Order Fulfillment     ${delivery_issue}           label=Delivery Issue in
    VerifyTileValue       Sales Order Fulfillment     9                           label=Invoicing Issue
    VerifyTileValue       Sales Order Fulfillment     ${journal}                  label=No Journal Entry

    # click tile
    ClickTile             Manage Sales Orders
    VerifyText            Standard
    VerifyText            Overall Status
 

 
