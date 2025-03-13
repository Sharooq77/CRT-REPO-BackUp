*** Settings ***
Library           OperatingSystem
Library           Collections
Library           JSONLibrary
Library           String

*** Variables ***
${JSON_FILE}      /home/executor/execution/SplitFunctionality/Resources/SampleJSON.json
${KEY_TO_SPLIT}   name
${DELIMITER}      " "

*** Test Cases ***
Read And Split JSON
    [Documentation]    Read a JSON file, parse it, and split a specific value.
    ${json_data}    Load JSON From File    ${JSON_FILE}
    Log    JSON Content: ${json_data}
    
    ${value}    Get Value From Json    ${json_data}    ${KEY_TO_SPLIT}
    ${split_values}    Split String    ${value}    ${DELIMITER}
    
    Log    Split Values: ${split_values}
    Should Not Be Empty    ${split_values}    The split result should not be empty.

*** Keywords ***
Load JSON From File
    [Arguments]    ${file_path}
    ${content}    Get File    ${file_path}
    ${json_data}    Convert String To JSON    ${content}
    [Return]    ${json_data}
