*** Settings ***
Library                      QWeb
Library                      QVision
Suite Setup                  Setup Browser
#Library                     CustomXPathLibrary.py
Library                      QForce
*** Variables ***
${username}                  trupti.c@cloudfulcrum.com
${login_url}                 https://intergraph-ppm--cpuat.sandbox.my.salesforce.com
${password}                  Cloud@12345

*** Keywords ***
Setup Browser
    OpenBrowser              about:blank                 chrome

Login
    [Documentation]          Login to Salesforce instance
    GoTo                     ${login_url}
    QWeb.TypeText            Username                    ${username}
    QWeb.TypeText            Password                    ${password}
    QWeb.ClickText           Log In

Home
    [Documentation]          Navigate to homepage, login if needed
    Run Keyword              Login

*** Test Cases ***
Creating opportunity
    [Documentation]          opportunity Management test Cases
    Run Keyword              Home
    QWeb.ClickText           Opportunities
    QWeb.ClickText           NewOpp62: MG Roberts Test Account

    # Wait for Primary Contact with timeout
    FOR                      ${i}                        IN RANGE              180          # 60 seconds timeout
        ${contact_visible}=                              Run Keyword And Return Status
        ...                  QWeb.VerifyText             Primary Contact       timeout=1
        Exit For Loop If     ${contact_visible}
        Sleep                1
    END

    # QWeb.verifyText        Update Stage
    QWeb.ClickText           Update Stage                anchor=Edit
    UseModal                 On
    sleep                    5
    QWeb.LogScreenshot
    QVision.VerifyText       Account
    QVision.VerifyText       Opportunity
    QVision.VerifyText       Stage
    QVision.ClickText        Stage
    HotKey                   enter
    QVision.VerifyText       1. Buyer Recognizes Need
    QVision.ClickText        1. Buyer Recognizes Need
    QVision.LogScreenshot
    QVision.VerifyText       Primary Contact
    QVision.ClickText        Add Opportunity Contact
    Sleep                    5
    QVision.LogScreenshot
    QVision.ClickText        Contact
    QVision.ClickText        Ben Jones (ben.jones@mgrobertest.com.invalid.invalid)
    QVision.ClickText        Save                        anchor=Cancel
    Sleep                    10
    QVision.ClickText        Opportunity Deal Type
    HotKey                   enter
    QVision.ClickText        Deal Tier 2: Lease Agreements
    QVision.ClickText        Save                        anchor=Cancel
    Sleep                    5

    QWeb.ClickText           Update Stage
    UseModal                 On
    sleep                    5
    QVision.VerifyText       Account
    QVision.VerifyText       Opportunity
    QVision.VerifyText       Stage
    QVision.ClickText        Stage
    HotKey                   enter
    QVision.VerifyText       2. Buyer Identifies Requirements
    QVision.ClickText        2. Buyer Identifies Requirements
    QVision.VerifyText       Product of Interest
    QVision.ClickText        Product of Interest
    HotKey                   enter
    QVision.ClickText        AcceleratorKMS
    QVision.ClickText        Notes
    Sleep                    3
    QVision.VerifyText       Solutions
    QVision.ClickText        None selected               anchor= Solutions
    HotKey                   enter
    QVision.ClickText        Plan
    QVision.ClickText        Notes

    QVision.LogScreenshot
    QVision.ClickText        Save                        anchor=Cancel
    sleep                    5

    QWeb.ClickText           Update Stage
    UseModal                 On
    sleep                    5
    QVision.VerifyText       Account
    QVision.VerifyText       Opportunity
    QVision.VerifyText       Stage
    QVision.ClickText        Stage
    HotKey                   enter
    QVision.VerifyText       3. Buyer Evaluates Options
    QVision.ClickText        3. Buyer Evaluates Options
    QVision.ClickText        Save                        anchor=Cancel
    sleep                    5

    QWeb.ClickText           Update Stage
    UseModal                 On
    sleep                    5
    QVision.VerifyText       Account
    QVision.VerifyText       Opportunity
    QVision.VerifyText       Stage
    QVision.ClickText        Stage
    HotKey                   enter
    QVision.VerifyText       6. Buyer Realizes Value
    QVision.ClickText        6. Buyer Realizes Value
    QVision.LogScreenshot
    QVision.ClickText        Save                        anchor=Cancel
    sleep                    5

    QVision.ScrollTo         Clone
    # sleep                  2
    # # QVision.ClickText    Upcoming & Overdue Activity
    # QVision.VerifyText     Clone                       anchor= Update Stage
    # # QVision.DoubleClick                              Clone
    # QVision.LogScreenshot
    # UseModal               On
    # Sleep                  2
    # QVision.ClickText      Cancel
     QVision.DoubleClick    Edit                        anchor=Clone              timeout=5
    # UseModal               On
    # Sleep                  2
    # QVision.ClickText      Cancel
    #                        QVision.ScrollTo            Clone
    # #                      QVision.ClickText           Cancel
    #                        QVision.DoubleClick         Edit                  anchor=2     timeout=5
    #QWeb.ClickElement        xpath=//span[normalize-space(.)='Edit']/parent::button[@aria-label='Edit']
    QVision.verifyText       Primary Contact
    QVision.ClickText        NewOpp62: MG Roberts Test Account
    QVision.ClickText        Deal Description
    QVision.TypeText         Deal Description            Oppo Created_Des
    QVision.ClickText        Notes
    QVision.TypeText         Notes                       Oppo Created_Notes
    QVision.VerifyText       Product Revenue Type
    QVision.ClickText        Product Revenue Type
    Hotkey                   enter
    Sleep                    2
    QVision.ClickText        GAA
    QVision.ClickText        Save                        anchor=Cancel
    Sleep                    5

