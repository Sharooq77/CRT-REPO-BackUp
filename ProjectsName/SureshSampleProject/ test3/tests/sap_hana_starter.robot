# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Documentation             Template suite for SAP S/4HANA automation
Resource                  ../resources/common.resource
Suite Setup               Setup Browser
Suite Teardown            End Suite

Library                QWeb



*** Variables ***
${sold_to_party}          17100001
${ship_to_party}          17100001
${material}               TG11


*** Test Cases ***
Accessing ReleaseOwl web pages
  [Documentation]                      Accessing Releaseowl web pages
    GoTo                               https://rodev-dev-ro-ui.cfapps.eu10.hana.ondemand.com/index.html#/Dashboard
    ClickText                          Default Identity Provider
    TypeText                           E-Mail, ID, or Login Name            suresh.t@releaseowl.com
    ClickText                          Continue
    ClickText                          I accept all cookies
    TypeSecret                         Password                             Ankamma@123
    ClickText                          Sign in
    ClickText                          suresh                               index=1
    ClickText                          Administration 
    ClickText                          Create New Project
    TypeText                           Name                                 new_suresh_cpi
    TypeText                           Description                          sample testing with crt
    DropDown                           Project Type                         SAP CPI
    ClickText                          Save
    ClickText                          OK
    ClickText                          Switch to Project View
   ClickElement                     xpath=//span[@id='__xmlview0--projectSelection-arrow']
   ClickText                           new_suresh_cpi
   VerifyText                          SAP CPI Management
   ClickText                           SAP CPI Management
                                 
    

    


    

