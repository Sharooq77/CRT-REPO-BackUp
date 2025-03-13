# *** Settings ***
# Suite Setup            Open Browser                about:blank                chrome
# Library                QForce
# Library                String
# Suite Teardown         End suite
# Resource               ../Resources/Common.robot

# *** Test Cases ***
#     [Documentation]    opportunity Management test Cases
# Creating opportunity
#     Appstate           Home
#     wait               
#     ClickText          Opportunities
#     ClickText          New
#     UseModal           On
#     ClickText          Next
#     TypeText           Opportunity Name            Test1
#     ComboBox           Search Accounts...          MG Roberts Test Account
#     PickList           Industry                    Financial
#     PickList           Opportunity Currency        SEK - Swedish Krona
#     ClickText          Close Date
#     ClickText          Today
#     # TypeText         Close Date                  12/18/2024
#     PickList           Stage                       0. Prospecting
#     ClickText          Save                        partial_match=False
   

# update the opportunity 
     
#     VerifyText    Schedule Next Customer Interaction\n\nDue Date
# Quote Generation 
#     ClickText          Quotes

