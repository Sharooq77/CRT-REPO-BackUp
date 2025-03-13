*** Settings ***

Documentation           New test suite
# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                 QForce
Library                 QWeb
Library                  QForce 
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Test Cases ***

Wait Strategies
    [Documentation]    Test Case created using the QEditor

Demonstrate Wait Strategies
    [Documentation]     This test case demonstrates different wait strategies in CRT
    [Tags]             wait_demo    salesforce

    # Implicit wait - Keywords have built-in waits
    Launch App    Sales
    
    # Explicit wait - Using timeout parameter (20 seconds)
    Click Text    Opportunities    timeout=20
    
    # Verification-based wait - Will wait up to 10 seconds (default timeout)
    Verify Text    New Opportunity
    
    # Combining strategies - Wait for field and verify its value
    Verify Field    Account Name    Sample Account    timeout=15
    
    # Using Is Text for conditional verification
    # This will check for text presence within 0.5 seconds
    ${exists}=    Is Text    Quick Create    
    
    # Waiting for modal dialog with specific timeout
    Use Modal    on    timeout=10
    
    # Wait strategy for dropdown selection
    Drop Down    Status    In Progress    timeout=15
    
    # Wait strategy for input fields
    Type Text    Description    Test description    timeout=10
    
    # Verification with longer timeout for slow-loading elements
    Verify Text    Related Items    timeout=30
