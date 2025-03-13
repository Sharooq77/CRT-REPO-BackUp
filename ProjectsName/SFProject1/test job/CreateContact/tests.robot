*** Settings ***
Library                   QForce
Library                   QWeb

*** Test Cases ***
Update Lead Using API
    [Documentation]       Updates an existing Lead record using Salesforce REST API
    [Tags]               lead    api    salesforce    update
    
    # First authenticate to get access to API
    Authenticate         ${client_id}    ${client_secret}    ${username}    ${password}    
    
    # Create a lead first to update
  
    ${lead_id}=         Create Record    Lead    FirstName=Jan   LastName=2025Name    Company=Acme Corp
   

    #Delete the lead record
    DeleteRecord         Lead            ${lead_id}

  
