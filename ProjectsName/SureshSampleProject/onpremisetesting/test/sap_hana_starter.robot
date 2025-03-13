# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Documentation             Template suite for SAP S/4HANA automation
Resource                  ../resources/common.resource
Suite Setup               Setup Browser
Suite Teardown            End Suite
Library                    QWeb
Library                    QForce
Library                    QVision


*** Variables ***
${sold_to_party}          17100001
${ship_to_party}          17100001
${material}               TG11


*** Test Cases ***
   [Documentation]            testing onpremise..
   
   #login to ro dev application.....................
    GoTo                        https://rodev-dev-ro-ui.cfapps.eu10.hana.ondemand.com/index.html#/Dashboard
    Set Library Search Order    QWeb
    ClickText                   Default Identity Provider
    TypeText                    E-Mail, ID, or Login Name                               suresh.t@releaseowl.com
    ClickText                   Continue
    ClickText                   I accept all cookies
    TypeSecret                  Password                    Ankamma@123
    ClickText                   Sign in
    ClickText                   suresh                      index=1


    #creating onpremise project............

    ClickText                   Administration
    ClickText                   Create New Project
    TypeText                    Name                                                suresh_onpremise3
    TypeText                    Description                                         testing
    clickelement               xpath=//span[@id='__xmlview2--idProjectType-arrow']
    ClickText                  SAP On-Premise
    ClickText                  Save
    ClickText                  ok
    ClickElement               xpath=//span[@title='suresh_onpremise3']
    ClickText                  Switch To Project
    
   #Adding environments..................

    clickelement               xpath=//span[@id='__xmlview0--projectSelection-arrow']
    ClickText                  Project Settings
    ClickText                  Environments
    ClickText                  Add
    TypeText                   Search    Suresh_Cloud_Connector
    clickelement               xpath=//div[@id='__dialog0-searchField-search']
    ClickText                  suresh_Cloud_Connector
    ClickText                  Select
    ClickCheckbox              Source                            On
    ClickText                  Users
    ClickItem                  Permissions                       anchor= Project Admin
    ClickCheckbox              Deploy                        On     anchor=suresh_Cloud_Connector
    #user security permission lock need to open (sharooq)
    
    
    #syncing and adding transport request to the project..........
    ClickText                  Transport Management (On-Premise)
    ClickCheckbox              Current Project Transports        off
    ClickText                  Sync Transports
    ClickText                  ok
    ClickText                  Sync Transports
    ClickText                  ok
    ClickItem                  More                        index=1
    ClickText                  Add to Project
    ClickCheckbox              Current Project Transports        On
    ClickItem                  More                        index=1
    ClickText                  Load Objects
    ClickText                  ok


    #creating release pipeline...........

    ClickText                  Release pipelines
    ClickText                  Create New Release Pipeline
    TypeText                   Release Pipeline Name             rpforcrttesting
    ClickText                  Step 2
    ClickText                  Add Stage
    TypeText                   Add Stage                        QA
    ClickText                  ok
    ClickText                  Add
    ClickText                  Deployment
    clickelement               xpath=//span[@id='__select0-arrow']
    ClickText                  suresh_Cloud_Connector
    clickelement               xpath=//span[@id='__select1-arrow']
    ClickText                  S4Q
    ClickText                  Step 3
    ClickText                  Save
    ClickText                  ok

    #creating sprint for the project.................

    ClickText                  Sprint
    ClickText                  Create Sprint
    TypeText                   Name                        sprint1
    ClickText                  Save
    ClickText                  ok
    ClickItem                  More
    ClickText                   Start Sprint
    ClickText                   ok
    #creating userstory and adding releasepipeline and tr to it...........

    ClickText                  User Stories
    ClickText                  Create New User Story
    TypeText                   Summary                        testing for crt 
    ClickText                  Save
    ClickText                  ok
    ClickItem                  More
    ClickText                  Edit

    
    


   
    
   
    
