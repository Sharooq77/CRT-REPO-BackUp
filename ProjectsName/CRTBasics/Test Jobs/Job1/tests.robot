
*** Settings ***

Documentation           New test suite
# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                 QForce 
Library                 FakerLibrary
Library                 DateTime
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Test Cases ***
TestingExecutionParameter
    LOG    ${test}
IfEseTest
    [Documentation]     This testcase checks the number of urls in google.com
    GoTo        https://www.google.com/
    ${CountUrls}=        GetElementCount   //a
    IF   ${CountUrls}==0 
        LOG              There are no urls
    ELSE IF    ${CountUrls}>5
        LOG    There are more than 5 urls
    ELSE IF    ${CountUrls}<5
        LOG    There are less than 5 urls
    END

LoopsTest
    [Documentation]    This test case loops through list of urls and logs the page title
    @{urls}=           Create List    https://www.google.com/    https://eu-robotic.copado.com/
    FOR    ${url}    IN    @{urls}    
        GOTO         ${url}
        ${title}=          GetTitle
        LOG                Title is      ${title}
    END

DateTest
    [Documentation]    This test case is check data time Library
    ${name}=           FakerLibrary.Name
    Log                ${name}
    ${name}=           FakerLibrary.User Name
    Log                ${name}
    ${date1} =	Convert Date	2014-06-11 10:07:42.000
    LOG                     ${date1}
    ${date2} =    Convert Date    2014-06-11 10:07:42.000    result_format=%Y/%m/%d
    LOG            ${date2}    # Will output: 2014-06-11 10:07:42
