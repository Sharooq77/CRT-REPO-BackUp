*** Settings ***
Library                  QWeb
 

*** Keywords ***
Setup Browser
    Open Browser          about:blank              chrome
 
 
End Suite
    Close All Browsers
 
Wait
    Sleep            5
    
Account creation
    goto    httt
    TypeText    username    Trtyuu
    TypeText    Password    fghj
    clicktext               Login 
    ClickText               Applauncher
    TypeText                search    account
    ClickText               New 
 
