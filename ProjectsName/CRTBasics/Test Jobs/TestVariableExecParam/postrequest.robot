*** Settings ***
Library    RequestsLibrary
Library    Collections
#Resource   ../resources/keywords.robot

*** Variables ***
${BASE_URL}         https://api.example.com
${ENDPOINT}         /api/v1/resource
${REQUEST_BODY}     {"name": "Test Item", "description": "Test Description"}
${EXPECTED_STATUS}  201
${HEADERS}          {"Content-Type": "application/json"}

*** Test Cases ***
Validate POST Request And Response
    [Documentation]    Tests POST request functionality and validates the response
    [Tags]    api    post    validation
    
    # Create session
    Create Session    api_session    ${BASE_URL}    headers=${HEADERS}    verify=True
    
    # Send POST request
    ${response}=    POST On Session    
    ...    api_session    
    ...    ${ENDPOINT}    
    ...    data=${REQUEST_BODY}
    ...    expected_status=${EXPECTED_STATUS}
    
    # Validate Response Status Code
    Should Be Equal As Strings    ${response.status_code}    ${EXPECTED_STATUS}
    
    # Parse response JSON
    ${response_json}=    Set Variable    ${response.json()}
    
    # Validate Response Structure
    Dictionary Should Contain Key    ${response_json}    id
    Dictionary Should Contain Key    ${response_json}    name
    Dictionary Should Contain Key    ${response_json}    description
    
    # Validate Response Content
    Should Be Equal    ${response_json['name']}        Test Item
   # Should Be Equal    ${response_json['description']} Test Description
    
    # Validate Response Headers
    Dictionary Should Contain Key    ${response.headers}    content-type
    Should Contain    ${response.headers['content-type']}    application/json
    
    # Log Response for Debugging
    Log    Response Status Code: ${response.status_code}
    Log    Response Headers: ${response.headers}
    Log    Response Body: ${response.text}

*** Keywords ***
Verify Response Schema
    [Arguments]    ${response_json}
    [Documentation]    Verifies that the response JSON matches expected schema
    
    # Add custom validation logic for your specific schema
    Should Be True    isinstance($response_json, dict)
    Dictionary Should Contain Key    ${response_json}    id
    Should Match Regexp    ${response_json['id']}    ^[0-9a-fA-F]{24}$

