*** Settings ***
Library    QWeb
Library    QForce
Library    ExcelLibrary

*** Test Cases ***
Write Test Results to Excel
    # Perform some test actions
    ${result1}=    Set Variable    Pass
    ${result2}=    Set Variable    Fail
    
    # Create a new Excel file
    Create Excel Document    test_results.xlsx
    
    # Write headers
    Write Excel Cell    1    1    Test Case    test_results.xlsx
    Write Excel Cell    1    2    Result    test_results.xlsx
    
    # Write test results
    Write Excel Cell    2    1    Test Case 1    test_results.xlsx
    Write Excel Cell    2    2    ${result1}    test_results.xlsx
    Write Excel Cell    3    1    Test Case 2    test_results.xlsx
    Write Excel Cell    3    2    ${result2}    test_results.xlsx
    
    # Save and close the Excel file
    Save Excel Document    test_results.xlsx
   Close All Excel Documents
*** Keywords ***
# Your custom keywords here
