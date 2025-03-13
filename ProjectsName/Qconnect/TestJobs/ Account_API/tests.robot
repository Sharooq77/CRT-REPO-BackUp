*** Settings ***
Documentation                   Example on how to use QForce REST API keywords
Library                         QForce
#Library                        QWeb
Library           DataDriver    file=C:\QconnectAPI\Cont.xlsx    sheet_name=Sheet1
Test Template                   Contact Operations
#Suite Setup                    Open Browser                about:blank                 ${BROWSER}
*** Variables ***
${BROWSER}                      chrome
${login_url}                    https://login.salesforce.com
${username}                     trupti@practicecfc.com
${password}                     Meera@12345
${client_id}                    3MVG9k02hQhyUgQBly6oie0QqHW9wIDeO_qxrVzni6hhyBkyXKvxLL6A.quHO1ZuK_Eqya6dVg_vTLgKwzmt9
${client_secret}                1EB1C049D25631F0E92BBFF2E0BB3B010E5C2E68643E94A7C6D50BA8FC3FA764
${home_url}                     ${login_url}/lightning/page/home

*** Test Cases ***
Contact Operations with ${LastName} ${AccountId} ${Email} ${MobilePhone}
*** Keywords ***           
Contact Operations
    [Arguments]                 ${LastName}                 ${AccountId}                ${Email}                ${MobilePhone}
    Log                         Starting Contact Operations for ${LastName}             console=True

    #Authenticate
    Authenticate                ${client_id}                ${client_secret}            ${username}             ${password}
    Log                         Authentication Successful                               console=True

    #Create Contact
    ${new_Contact}=             Create Record               Contact                     LastName=${LastName}    AccountId=${AccountId}      Email=${Email}
    Set Suite Variable          ${new_Contact}
    Log                         Contact Created: ${new_Contact}                         console=True

    ##Query Contact
    ${results}=                 Query Records               query=Select Id, LastName FROM Contact Where LastName='${LastName}'
    ${count}=                   Set Variable                ${results}[totalSize]
    Log                         Query Result Count: ${count}                            console=True

    #Update Contact
    ${Updatecontact}=           Update Record               Contact                     ${new_Contact}          MobilePhone=${MobilePhone}
    Set Suite Variable          ${Updatecontact}
    Log                         Contact Updated: ${Updatecontact}                       console=True

    #Delete Contact
    ${query_result}=            Query Records               query=Select Id FROM Contact Where Email='${Email}'
    ${contact_id_to_delete}=    Set Variable                ${query_result}[records][0][Id]
    Delete Record               Contact                     ${contact_id_to_delete}
    Log                         Contact Deleted: ${contact_id_to_delete}                console=True

    #Revoke Authentication
    Revoke
    Log                         Authentication Revoked      console=True

