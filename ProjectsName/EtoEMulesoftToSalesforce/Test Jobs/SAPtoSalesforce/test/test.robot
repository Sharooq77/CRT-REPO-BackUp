
*** Settings ***
Library                      QVision
Library                      QWeb
Library                      QForce
Documentation                Template suite for SAP S/4HANA automation
Resource                     ../Resources/Common.robot
Suite Setup                  Setup Browser
Suite Teardown               End Suite
Resource                     locator.robot

*** Test Cases ***    
Sync the Flight booking details from SAP via MuleSoft and later save the data to Salesforce.
    GoTo                     ${URL_SAP}
    Run Keyword              Wait
    QWeb.ClickText           Advanced
    QWeb.ClickText           Proceed to gldusenw.releaseowl.com
    UseModal                 On
    QVision.VerifyAny        ${Verify_title}
    QVision.TypeText         Username                    ${Password1}
    QVision.TypeText         Password                    ${Username1}
    QVision.ClickText        Sign in
    Run Keyword              Wait
    QWeb.ClickText           Go
    QVision.ClickText        ${Agency_ID}                anchor=Mechler (225)
    QVision.VerifyText       Booking                     anchor=2
    QVision.ClickText        Create
    Run Keyword              Wait
    ClickElement             ${Booking_Date}
    QVision.ClickText        16
    ClickElement             ${Customer_ID}
    QWeb.ClickText           Go
    QVision.ClickText        Johannes
    ClickElement             ${Airline_ID}
    QWeb.ClickText           Go
    QVision.ClickText        American Airlines Inc.
    ClickElement             ${Flight_Number}
    QWeb.ClickText           Go
    QWeb.ClickText           Apr 25, 2025
    QWeb.ClickText           Save
    Run Keyword              Wait
    GoTo                     ${URL_SFDC}
    QWeb.TypeText            Username                    ${Username2}
    QWeb.TypeText            Password                    ${Password2}
    QWeb.ClickText           Log In
    QForce.LaunchApp         FlightBooking
    QWeb.ClickText           Recently Viewed
    QWeb.ClickText           All
    #ClickElement            ${Record}

Salesforce data creation fails when Mulesoft is unable to hit the API at the moment
    GoTo                     ${URL_SAP}
    Run Keyword              Wait
    QWeb.ClickText           Go
    QVision.ClickText        ${Agency_ID}                anchor=Mechler (225)
    QVision.VerifyText       Booking                     anchor=2
    QVision.ClickText        Create
    Run Keyword              Wait
    ClickElement             ${Booking_Date}
    QVision.ClickText        16
    ClickElement             ${Customer_ID}
    QWeb.ClickText           Go
    QVision.ClickText        Johannes
    ClickElement             ${Airline_ID}
    QWeb.ClickText           Go
    QVision.ClickText        American Airlines Inc.
    ClickElement             ${Flight_Number}
    QWeb.ClickText           Go
    QWeb.ClickText           Apr 25, 2025
    QWeb.ClickText           Save
    Run Keyword              Wait
    GoTo                     ${Mule}
    QWeb.ClickText           Advanced
    QWeb.ClickText          Proceed to mulesoft-ca87xn.5sc6y6-3.usa2-e2.cloudhub.io (unsafe)
     Run Keyword              Wait
   QWeb.VerifyText                Record Created
