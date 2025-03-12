*** Settings ***
Library           QVision

*** Test Cases ***
Open Notepad and Perform Actions
    RunCommand    Notepad
    VerifyText    Untitled - Notepad
     # Maximize Notepad window
    #HotKey        WIN+UP
    #ClickText    Maximize    anchor=Minimize
    #ClickText     Add new tab
    WriteText     Hello Copado Robotic Testing
    HotKey        ENTER
    WriteText     This is a test script.
    HotKey       ENTER
    WriteText     Performing additional actions:
    HotKey        ENTER
    WriteText     1. Adding multiple lines
    HotKey        ENTER
    WriteText     2. Using different text formatting
   # Save the document
    ClickText    File
    VerifyText   Save
    ClickText    Save     anchor=Save As
    TypeText    Save as type:  Text Document(*.txt)
    TypeText    File name    ${EMPTY}
    TypeText    File name    CRT_WordPad_Test1_notepad1
    ClickText    Save        anchor=Cancel
    #ClickText    Yes
    # Close WordPad
    ClickText    File
    Sleep        3
    ClickText    Exit
