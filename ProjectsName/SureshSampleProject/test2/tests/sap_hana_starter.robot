# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings *** 
Documentation          Template suite for SAP S/4HANA automation
Resource               ../resources/common.resource
Suite Setup            Setup Browser
Suite Teardown         End Suite


*** Variables ***
${sold_to_party}       17100001
${ship_to_party}       17100001
${material}            TG11


*** Test Cases ***
Accessing ReleaseOwl web account through crt 
    [Documentation]    Accessing RO web
    GoTo               https://rodev-dev-ro-ui.cfapps.eu10.hana.ondemand.com/index.html#/Dashboard
    ClickText          Default Identity Provider
    TypeText           E-Mail, ID, or Login Name                              suresh.t@releaseowl.com
    ClickText          Continue
    TypeSecret         Password                    Ankamma@123
    ClickText          Sign in
    ClickText          I accept all cookies
    ClickText          suresh                      index=1


