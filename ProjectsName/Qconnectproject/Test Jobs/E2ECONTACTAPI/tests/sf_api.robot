*** Settings ***

Documentation             Example on how to use QForce REST API keywords
Library                   QForce
Resource                  ../resources/common.resource
Suite Setup               Setup Browser
Suite Teardown            End Suite


*** Variables ***
${username}               sharooq.a@cloudfulcrum.com.org
${login_url}              https://login.salesforce.com
${password}               Cloud@1234
${client_id}              3MVG9VMBZCsTL9hlH6ivrOJLCMHkrM00nf_kmj4XdDL0GXXSvwGpab8223PBH_y.pTS75F_Mi_SlIZNRzPNzC
${client_secret}          4EB20593C4003A8A4FA8C28C9126D432B0FA5AF7AB4218143ACECD5E4CC7E753


*** Test Cases ***
Create Account and Contact via REST API
    [Documentation]       Example test case on how to create test data using REST API
    [tags]                REST API                    Create
    
    # --------------------------NOTE--------------------------------------------------------
    # Authentication needs to be done once prior to using other REST API keywords
    # For authentication a client_id and client secret from a Connected oauth app are needed
    # in addition to test user's credentials
    # --------------------------------------------------------------------------------------
   Authenticate    ${client_id}    ${client_secret}    ${username}    ${password}    sandbox=False
    # --------------------------NOTE--------------------------------------------------------
    # For creating data, just use keyword "Create Record" with data type you want to
    # create + fields and values
    # --------------------------------------------------------------------------------------
    ${my_acc}=            Create Record               Account             Name=TestCorp123
    ${my_contact}=        Create Record               Contact             FirstName=Jane      LastName=Doe

    # --------------------------NOTE--------------------------------------------------------
    # id of created records is returned and stored in variables above.
    # Let's make these suite level variables, so that we can re-use them later
    # --------------------------------------------------------------------------------------
    Set Suite Variable    ${my_acc}
    Set Suite Variable    ${my_contact}
