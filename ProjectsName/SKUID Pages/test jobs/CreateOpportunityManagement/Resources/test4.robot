# *** Settings ***
# Library                    QWeb
# Library                   QVision
# Suite Setup                Setup Browser
# #Library                   CustomXPathLibrary.py
# Library                    QForce
# *** Variables ***
# ${username}                trupti.c@cloudfulcrum.com
# ${login_url}               https://intergraph-ppm--cpuat.sandbox.my.salesforce.com
# ${password}                Cloud@12345

# *** Keywords ***
# Setup Browser
#     OpenBrowser            about:blank                 chrome

# Login
#     [Documentation]        Login to Salesforce instance
#     GoTo                   ${login_url}
#     QWeb.TypeText          Username                    ${username}
#     QWeb.TypeText          Password                    ${password}
#     QWeb.ClickText         Log In

# Home
#     [Documentation]        Navigate to homepage, login if needed
#     Run Keyword            Login

# *** Test Cases ***
# Creating opportunity
#     [Documentation]        opportunity Management test Cases
#     Run Keyword            Home
#     QWeb.ClickText              Opportunities
#     QWeb.ClickText              NewOpp2: MG Roberts Test Account

#     # Wait for Primary Contact with timeout
#     FOR                    ${i}                        IN RANGE           180           # 60 seconds timeout
#         ${contact_visible}=                            Run Keyword And Return Status
#         ...                QWeb.VerifyText                  Primary Contact    timeout=1
#         Exit For Loop If                               ${contact_visible}
#         Sleep              1
#     END
#     # Click By XPath       //span[contains(text(),'Update Stage')]"
#     QWeb.ClickText              Update Stage
#     UseModal               On
#     sleep                  5
#     QWeb.LogScreenshot  UseModal           On
#     QVision.ClickText          Stage    anchor=Name    timeout=10
    
#     # If the above doesn't work, try Method 2 with JavaScript
        
    
#     ${js_script}=    Set Variable
#     ...    const elem = document.querySelector('${dropdown_selector}');
#     ...       if (elem) {
#     ...        elem.setAttribute('aria-haspopup', 'listbox');
#     ...        elem.click();
    
#     ExecuteJavascript    ${js_script}
#     Sleep    1
#     ClickText    ${option_text}
#         ExecuteJavascript       return document.title;     $TITLE
#     Sleep              1
    
#     # Verify dropdown opened
#     VerifyText         Prospecting    timeout=5
#     # For dropdown/picklist interaction
#     # Clicktext            *Stage
#     # Typetext             *Stage                      1. Buyer Recognizes Need
#     # #DropDown            *Stage                      1. Buyer Recognizes Need        recognition_mode=vision
#     #                      #                           ClickText          button       1. Buyer Recognizes Need
#     #                      #                           ClickElement       xpath=//button[@aria-haspopup='listbox'or @class='c_745_43 c_745_50 c_745_56 c_745_51']    js=true
#     QWeb.SetConfig              ShadowDOM                   True
#     VerifyAll                   Account,Opportunity
#     QWeb.ClickText                   Stage
#     # ClickElement         xpath=//button[@aria-haspopup='listbox']       # tag=button
#     #ClickElement           xpath= //label[@data-prop-id='StageName']/following-sibling::div//button            js=true
#     sleep                  1
#     Hotkey                 enter
#     # ClickText            Stage                       xpath=//button[@aria-haspopup='listbox']                js=true    partial_match=True

#     sleep                  5
#     QWeb.LogScreenshot
#     #                      # QVision.ClickText         Stage*
#     QVision.ClickText              1. Buyer Recognizes Need
#     #                      # #QVision.VerifyText       Primary Contact
#     #                      # sleep                     10


#     QWeb.LogScreenshot


#     #                      ClickText                   2. Buyer Identifies Requirements                        anchor=Stage*    recognition_mode=vision
#     # ClickText            2. Buyer Identifies Requirements--             anchor=Stage*
#     # ClickText            2. Buyer Identifies Requirements--             anchor=Stage*
#     # ClickText            2. Buyer Identifies Requirements--             anchor=Stage*
#     # ClickText            5. Buyer Purchases Solution                    anchor=Skip to Navigation
#     # ClickText            Add Opportunity Contact
#     # ClickText            Show options
#     # ClickText            Select
#     # ClickText            Melanie Roberts (melanie.roberts@hexagon.com.invalid)
#     # ClickText            Save                        anchor=Cancel
#     # ClickText            Deal Tier 1: New/Expanded SaaS, New/Expanded Perpetual, All EAM Sales--             anchor=Opportunity Deal Type*
#     # ClickText            Deal Tier 1: New/Expanded SaaS, New/Expanded Perpetual, All EAM Sales--             anchor=Opportunity Deal Type*
#     # ClickText            Deal Tier 1: New/Expanded SaaS, New/Expanded Perpetual, All EAM Sales
#     # ClickText            Save                        anchor=Handoff to Sales Rep
#     # ClickText            Close modal


#     # ClickText            2. Buyer Identifies Requirements--             anchor=Stage*
#     # ClickText            2. Buyer Identifies Requirements--             anchor=Stage*
#     # ClickText            2. Buyer Identifies Requirements--             anchor=Stage*
#     # ClickText            2. Buyer Identifies Requirements               anchor=Skip to Navigation
#     # ClickText            2. Buyer Identifies Requirements--             anchor=Stage*
