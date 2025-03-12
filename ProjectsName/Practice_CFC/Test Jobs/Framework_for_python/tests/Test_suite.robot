*** Settings ***

Variables    ../python.py/python_variable.py


*** Variables ***
${var1}=     A Variable Content
${name}=     ${python_dict['name']}
${last_name}=     ${python_dict['last_name']}
