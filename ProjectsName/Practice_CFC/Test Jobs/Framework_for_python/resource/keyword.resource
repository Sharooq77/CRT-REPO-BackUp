*** Settings ***
Library       ../python.py/python_keyword.py

*** Keywords ***
Say Hello World
    Log To Console    Hello World

Call A Library Keyword
    Lib Keyword    Hello Robot
