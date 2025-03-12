*** Settings ***
Library                         RequestsLibrary
Library                         Collections
Library                         JSONLibrary
Library                         QForce

*** Variables ***
${LOGIN_URL}                    https://login.salesforce.com
${username}                     sharooq.a@cloudfulcrum.com.org
${password}                     Cloud@1234
${client_id}                    3MVG9VMBZCsTL9hlH6ivrOJLCMHkrM00nf_kmj4XdDL0GXXSvwGpab8223PBH_y.pTS75F_Mi_SlIZNRzPNzC
${client_secret}                4EB20593C4003A8A4FA8C28C9126D432B0FA5AF7AB4218143ACECD5E4CC7E753

*** Keywords ***
Authenticate to Salesforce
    Authenticate                ${client_id}                ${client_secret}            ${username}                 ${password}
    ${access_token}=            Get Access Token
    Set Suite Variable          ${AUTH_HEADER}              Bearer ${access_token}
    Set Suite Variable          ${INSTANCE_URL}             ${instance_url}
    Set Suite Variable          ${API_VERSION}              v57.0
    Set Suite Variable          ${API_BASE_URL}             ${INSTANCE_URL}/services/data/${API_VERSION}
    
Log API Response
    [Arguments]                 ${method}                   ${response}
    Log                         ${method} Status Code: ${response.status_code}
    Log                         ${method} Response Content: ${response.content}
    ${response_json}=           Evaluate                    json.loads(''${response.content}'')                   json
    Log                         ${method} Response JSON: ${response_json}
    
*** Test Cases ***
Perform API Testing and Log Status Codes
    Authenticate to Salesforce
    ${headers}                  Create Dictionary           Authorization=${AUTH_HEADER}                            Content-Type=application/json
    Create Session              salesforce                  ${API_BASE_URL}             headers=${headers}          verify=${True}
    
    # POST request (creating a new Account)
    ${data}=                    Create Dictionary           Name=Test Account API 3
    ${post_response}=           POST On Session             salesforce                  /sobjects/Account           json=${data}           expected_status=any
    Log API Response            POST                        ${post_response}
    
    # GET request (retrieving Account information)
    ${get_response}=            GET On Session              salesforce                  /sobjects/Account           expected_status=any
    Log API Response            GET                         ${get_response}
    
    # Verify status codes
    Should Be Equal As Strings                              ${post_response.status_code}                            201                    POST request failed
    Should Be Equal As Strings                              ${get_response.status_code}                             200                    GET request failed
