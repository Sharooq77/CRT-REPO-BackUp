*** Settings ***
Library                   QForce
Library                   String
Library                   QWeb
Suite Setup               Open Browser                about:blank                 ${BROWSER}

*** Variables ***
${BROWSER}                chrome
${username}               sharooq.a@cloudfulcrum.com.org
${login_url}              https://login.salesforce.com
${password}               Cloud@1234
${home_url}                ${login_url}/lightning/page/home

*** Keywords ***
Setup Browser
    Open Browser          about:blank                 ${BROWSER}
    SetConfig             LineBreak                   ${EMPTY}                    #\ue000
    SetConfig             DefaultTimeout              30s                         #sometimes salesforce is slow
    SetConfig             CSSSelectors                False

End suite
    Close All Browsers


Login
    [Documentation]       Login to Salesforce instance
    GoTo                  ${login_url}
    TypeText              Username                    ${username}
    TypeSecret            Password                    ${password}
    ClickText             Log In
