*** Settings ***
Library    QVision

*** Test Cases ***
WordPad Connection Test
    # Open WordPad application
    Open Application    wordpad
    VerifyText          WordPad

    # Type some text
    TypeText    Document    Hello, Copado Robotic Testing!
    #VerifyText    Hello, Copado Robotic Testing!

    # Perform some basic text formatting
    #ClickText    Home
    # ClickText    Bold
    # ClickText    Italic
    # ClickText    Underline

    # Save the document
    ClickText    File
    ClickText    Save
    ClickText    File name
    TypeText    Save as type:  Text Document(*.txt)
    TypeText    File name    ${EMPTY}
    TypeText    File name    CRT_WordPad_Test1
    ClickText    Save        anchor=Cancel
    ClickText    Yes
    # Close WordPad
    ClickText    File
    Sleep        3
    ClickText    Exit
