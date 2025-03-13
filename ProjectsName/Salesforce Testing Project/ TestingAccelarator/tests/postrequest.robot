*** Settings ***
Library                   QWeb
Library                   QForce
Library                   RequestsLibrary
Library                   Collections

*** Variables ***
${API_ENDPOINT}          https://jsonplaceholder.typicode.com
${EXPECTED_STATUS}       201

*** Test Cases ***
Test Post Request And Validation
    [Documentation]     Creates a new post using POST request and validates the response
    [tags]             api    post    validation
    
    # Create session
    Create Session      jsonplaceholder    ${API_ENDPOINT}
    
    # Prepare request body
    &{body}=           Create Dictionary
    ...                title=Test Post
    ...                body=This is a test post
    ...                userId=1
    
    # Make POST request
    ${response}=       POST On Session
    ...                jsonplaceholder
    ...                /posts
    ...                json=${body}
    ...                expected_status=${EXPECTED_STATUS}
    
    # Verify response status code
    Should Be Equal As Strings    ${response.status_code}    ${EXPECTED_STATUS}
    
    # Get response body as dictionary
    ${response_body}=  Set Variable    ${response.json()}
    
    # Verify response contains expected data
    Dictionary Should Contain Item    ${response_body}    title    Test Post
    Dictionary Should Contain Item    ${response_body}    body     This is a test post
    Dictionary Should Contain Item    ${response_body}    userId   1
    
    # Verify response contains id (created by the server)
    Dictionary Should Contain Key     ${response_body}    id
    
    # Log response for debugging
    Log    Response: ${response_body}

    # Clean up
    Delete All Sessions
