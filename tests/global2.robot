*** Settings ***
 
Documentation           New test suite
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers
 
 
 
*** Test Cases ***
global
   Log To Console   ${GlobalVar}
has context menu