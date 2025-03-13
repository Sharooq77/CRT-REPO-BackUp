*** Settings ***
Library             QWeb
Library             QForce
Documentation       New test suite
# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library             QForce
Suite Setup         Open Browser                about:blank               chrome
Suite Teardown      Close All Browsers

*** Test Cases ***
Account
    Open Browser    about:blank                 chrome
    GoTo            https://login.salesforce.com
    TypeText        Username                    trupti@practicecfc.com
    TypeText        Password                    Meera@12345
    ClickText       Log In
    LaunchApp       Sales
    ClickText       Accounts
    ClickText       New
    TypeText        *Account Name               TestConnect
    ClickText       Save                        partial_match=False
    
