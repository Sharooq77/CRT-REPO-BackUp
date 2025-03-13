*** Settings ***
Resource               ../Resources/Common.robot
Library                QForce
Library                String

*** Keywords ***
Creating opportunity
    ClickText          Opportunities
    ClickText          New
    UseModal           On
    ClickText          Standard OpportunityGlobal Standard Opportunity Process
    ClickText          Next
    TypeText           Opportunity Name            Test_SKUID_oopo
    ComboBox           Search Accounts...            TestSkuid
    PickList           Industry                    Financial
    PickList           Opportunity Currency        SEK - Swedish Krona
    ClickText          Close Date
    ClickText          Today
    PickList           Stage                       Opportunity Identified
    PickList           Forecast Category           Upside
    ClickText          Save                        partial_match=False
    ClickText          Close error dialog
    ClickText          Close this window
    UseModal           Off
