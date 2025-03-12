*** Settings ***
Library                  QWeb
Library                  ExcelOperations.py
Library                  OperatingSystem

*** Test Cases ***
Create Local Excel File
    # Use local directory path
    ${local_path}=       Set Variable                C:/TestData                 # For Windows
    # OR for Linux/Mac:
    # ${local_path}=     Set Variable                /home/user/TestData

    # Create directory if it doesn't exist
    Create Directory     ${local_path}

    # Create Excel file locally
    ${excel_file}=       Set Variable                ${local_path}/test_dataWrite.xlsx
    Open Excel File      ${excel_file}
    Get Sheet            Sheet1
    Write Cell           1                           1                           Test Data1
    Write Cell           2                           1                           Test Data2
    Write Cell           3                           1                           Test Data3
    Write Cell           4                           1                           Test Data4
    Write Cell           5                           1                           Test Data5
    Save Excel File      ${excel_file}

    # Verify file exists
    File Should Exist    ${excel_file}
    Log                  Excel file created at: ${excel_file}                    level=INFO
