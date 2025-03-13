# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Documentation             Template suite for SAP S/4HANA automation
Resource                  ../resources/common.resource
Suite Setup               Setup Browser
Suite Teardown            End Suite
Library                    QVision
Library                    QWeb
Library                    QForce
*** Variables ***
${sold_to_party}          17100001
${ship_to_party}          17100001
${material}               TG11


*** Test Cases ***
SAP Onprime tr request
  [Documentation]                SAP Onprime login to ReleaseOwl Dev account  
    GoTo                                    https://rodev-dev-ro-ui.cfapps.eu10.hana.ondemand.com/index.html#/Dashboard
    Set Library Search Order                QWeb 
    ClickText                          Default Identity Provider
    TypeText                           E-Mail, ID, or Login Name            suresh.t@releaseowl.com
    ClickText                          Continue
    ClickText                          I accept all cookies
    TypeText                           Password                             Ankamma@123
    ClickText                          Sign in
    ClickText                          suresh                               index=1


                                # creating sap on premise new project   
    ClickText                          Administration
    ClickText                          Create New Project
    TypeText                           Name                                 Suresh_Onprime3
    TypeText                           Description                          tr request
    ClickElement                       xpath=//span[@id='__xmlview2--idProjectType-arrow']
    DropDown                           Project Type                         SAP On-Premise
    ClickText                          Save
    ClickText                          OK
                 #creating SAP onprime credentials
     ClickText                        Credential Manager
     ClickText                        Register Credential
     TypeText                         Credential Name                          Suresh_Onpremise1 
     ClickElement                     xpath=//span[@id='__xmlview4--credTypeId-arrow']  
     ClickText                        Transport Manager Credential 
     TypeText                        User Name                         ROPL067
     TypeText                        Password                          Ankamma@123
     ClickText                       Save
     ClickText                       Ok

                 #creating transport domain controller.
      ClickText                      Transport Domain Controller
      ClickText                      Register Transport Domain Controller
      TypeText                       Name                         Suresh_Cloud_Connector1
      ClickText                      Proxy Type
      ClickText                      None

    #switching to the new project and adding environments and giving required permissions 
    ClickText                          Switch to Project View
    ClickElement                       xpath=//span[@id='__xmlview0--projectSelection-arrow']
    ClickText                          Suresh_Onprime1
    ClickElement                       xpath=//span[@id='__xmlview0--projectSelection-arrow']
    ClickText                          Project Settings
    ClickText                          Environments
    ClickText                          Add                    
    Swipe down           2     
    ClickCheckbox        suresh_dem    On
    ClickText            Select
    ClickCheckbox        Source        On
    ClickText            Users
    ClickItem            Permissions    anchor=Project Admin
    ClickCheckbox        Deploy        On  


    ClickText                          Transport Management (On-Premise)
    ClickCheckbox                      Current Project Transports           Off
    ClickText                          Sync Transports
    TypeText                            Filter                               ROPL067
    QVision.HotKey                           enter
    ClickElement                        xpath=//div[contains(@id,'searchField-search')]
    Set Library Search Order                 QVision
    ClickText                          ...                                        DEMK902174   index=2 
    ClickText                          Add to Project 
    ClickCheckbox                      Current Project Transports           on
    ClickText                          Sprints
    ClickText                          Create
    TypeText                           Name                          Sprint1
    ClickText                          Save
    ClickText                          Ok
    ClickItem                          More
    ClickText                          Start Sprint 
    ClickText                          Ok 
    ClickText                          User Stories 
    ClickText                          Create New User Story
    TypeText                          Summary                        Transport Promotion
    TypeText                          Description                    TR
    ClickText                         Save
    ClickText                         Ok
    ClickText                         Release Pipelines
    ClickText                         Create New Release Pipeline
    TypeText                          Release Pipeline Name              TR1
    ClickText                         Step 2
    ClickText                         Add Stage
    TypeText                          Add Stage                        QA
    ClickText                         Ok
    ClickText                         Add                            anchor=Tasks
    ClickText                         Deployment
    # DropDown                          Domain Controller              suresh dem    timeout=15
    ClickElement                     xpath=//span[@id="__select0-label"]
    ClickText                        suresh_dem
    DropDown                         Target System                   DEQ.100
    ClickText                        suresh_dem
   
