*** Settings ***
#Library    QWeb
Library    ExcelOperations.py
Library    OperatingSystem

*** Test Cases ***
Write Excel File
    # Create with absolute path
    ${current_dir}=    Get Environment Variable    PWD
    ${excel_file}=    Set Variable    ${current_dir}/test_data.xlsx
    Log    Attempting to create Excel file at: ${excel_file}    level=INFO
    
    # Create Excel file with verification
    Create Excel    ${excel_file}
    
    # Verify file exists and log its details
    Run Keyword And Continue On Failure    File Should Exist    ${excel_file}
    ${file_exists}=    Run Keyword And Return Status    File Should Exist    ${excel_file}
    Log    File exists status: ${file_exists}    level=INFO
    
    # List directory contents for debugging
    ${files}=    List Files In Directory    ${current_dir}
    Log    Files in directory: ${files}    level=INFO

*** Keywords ***
Create Excel
    [Arguments]    ${file_path}
    Open Excel File    ${file_path}
    Get Sheet    Sheet1
    Write Cell           1                           1                           Test Data1
    Write Cell           2                           1                           Test Data2
    Write Cell           3                           1                           Test Data3
    Save Excel File    ${file_path}
    Log    Excel file saved to: ${file_path}    level=INFO
