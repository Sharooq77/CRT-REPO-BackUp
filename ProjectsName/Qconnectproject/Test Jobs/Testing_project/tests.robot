*** Settings ***
Library    QWeb
Library    QForce
Documentation           New test suite
# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                 QForce
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers
 
*** Test Cases ***
Account
  Open Browser    about:blank    chrome
    GoTo            https://login.salesforce.com
    TypeText        Username     sharooq.a@cloudfulcrum.com.org
    TypeText        Password     Cloud@1234
    ClickText       Log In
    LaunchApp       Sales
    ClickText       Account
    ClickText       New
    TypeText    *Account Name     Qcoonect
    ClickText    Save    partial_match=False
