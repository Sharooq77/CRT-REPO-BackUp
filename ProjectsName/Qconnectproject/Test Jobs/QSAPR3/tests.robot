*** Settings ***
Library    QSapR3
*** Test Cases ***
    [Documentation]            Vrsion of QS4Hana  and QSAPR3

Check License Features
    ${has_qsapr3}=    Run Keyword And Return Status    Import Library    QSapR3
    Log    Has QSapR3: ${has_qsapr3}

    
