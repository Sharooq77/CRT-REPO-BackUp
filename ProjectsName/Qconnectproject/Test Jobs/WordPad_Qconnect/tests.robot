# *** Settings ***
# Library           QVision
 
# *** Variables ***
# ${FILENAME}       wordpad_test.rtf 

# *** Test Cases ***
# WordPad Test
#     OpenApplication    wordpad
#     VerifyText         Document - WordPad
#     TypeText           Text Editor    Hello, Copado Robotic Testing!
#     VerifyText         Hello, Copado Robotic Testing!
#     SaveWordPadFile    wordpad_test.rtf
#     CloseWordPad

# *** Keywords ***
# SaveWordPadFile
#     [Arguments]    ${FILENAME} 
#     ClickText      File
#     ClickText      Save as
#     VerifyText     Save as    timeout=5s
#     TypeText       File name:    ${FILENAME}    anchor=Save as type    index=1
#     ClickText      Save

# CloseWordPad
#     ClickText    File
#     ClickText    Exit
   
