*** Settings ***
Library                         QVision
Library                         DateTime
Library                         Process

*** Test Cases ***
Open New Notepad and Save Unique Fiśle
    [Documentation]             This test case opens a new Notepad instance, writes content, and saves with a unique filename

    # Close any existing Notepad instances
    Close Existing Notepad Instances

    # Open a new instance of Notepad
    ${timestamp}=               Get Current Date            result_format=%Y%m%d_%H%M%S
    ${unique_filename}=         Set Variable                CRT_Notepad_Test_${timestamp}.txt
    RunCommand                  notepad "${unique_filename}"
    sleep                       2
    DoubleClick                 Yes                         anchor=No
    Sleep                       3
    # VerifyText                OK
    # ClickText                 OK
    # Verify Notepad is open with a new file

    Sleep                       2
    # Write content
    WriteText                   Hello Copado Robotic Testing
    HotKey                      ENTER
    WriteText                   This is a test script.
    HotKey                      ENTER
    WriteText                   Performing additional actions:
    HotKey                      ENTER

    # Save the document
    ClickText                   File
    HotKey                      ctrl                        s
    HotKey                      alt                         f4

*** Keywords ***
Close Existing Notepad Instances
    [Documentation]             Closes any existing Notepad instances
    ${result}=                  Run Process                 taskkill /F /IM notepad.exe               shell=True
    Log                         ${result.stdout}
    Sleep                       2
