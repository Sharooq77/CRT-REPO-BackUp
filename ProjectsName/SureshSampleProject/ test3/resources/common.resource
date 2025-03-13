*** Settings ***
Library                   QS4Hana
Library                   String


*** Variables ***
# IMPORTANT: Please read the readme.txt to understand needed variables and how to handle them!!
${BROWSER}                chrome
${username}               some_user                   # given as example here. Give this, password & login_url in CRT variables section
${login_url}              https://rodev-dev-ro-ui.cfapps.eu10.hana.ondemand.com/index.html#/Dashboard                   # given as example here. Give this, username & password in CRT variables section


*** Keywords ***
Setup Browser
    Open Browser          about:blank                 ${BROWSER}


End Suite
    Close All Browsers


Login
    [Documentation]       Login to SAP S/4HANA instance
    TypeText              E-Mail or User Name         ${username}
    TypeSecret            Password                    ${password}
    ClickText             Log On



Home
    GoTo                  ${login_url}
    GoTo                  ${login_url}
    ${logged_in}=         IsItem                      meAreaHeaderButton          timeout=5
    Run Keyword Unless    ${logged_in}                Login
    ClickItem             shell-header-icon
    VerifyText            Home
