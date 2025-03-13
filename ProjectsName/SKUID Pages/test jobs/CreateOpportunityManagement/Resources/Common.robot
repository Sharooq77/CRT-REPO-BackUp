*** Settings ***
Library                SeleniumLibrary
#Suite Setup             Open Browser    about:blank     ${BROWSER}
Library                         QVision
*** Variables ***
${BROWSER}                edge
${username}               trupti.c@cloudfulcrum.com
${login_url}             https://intergraph-ppm--cpuat.sandbox.my.salesforce.com
${password}                Cloud@12345


*** Keywords ***

Login
    [Documentation]       Login to Salesforce instance
   
    GoTo                  ${login_url}
     QVision.TypeText              Username                    ${username}             delay=1
     QVision.TypeText              Password                    ${password}
     QVision.ClickText             Log In


Home
    [Documentation]       Navigate to homepage, login if needed
    Set Library Search Order                          QWeb                   QForce
    Run Keyword                        Login
    
wait
  Sleep        3    
