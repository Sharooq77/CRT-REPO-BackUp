*** Settings ***
Library    QS4Hana
Library    QSapR3
*** Test Cases ***
    [Documentation]            Vrsion of QS4Hana  and QSAPR3
# Check QS4Hana Version
#     ${version}=    Evaluate    QS4Hana.__version__
#     Log    QS4Hana Version: ${version}
 
 
# Check QSAPR3 Version
#     ${version}=    Evaluate    QSAPR3.__version__
#     Log    QSAPR3 Version: ${version}
    
Check License Features
    ${has_qsapr3}=    Run Keyword And Return Status    Import Library    QSapR3
    Log    Has QSapR3: ${has_qsapr3}

    # ${has_qs4hana}=    Run Keyword And Return Status    Import Library    QS4Hana
    # Log    Has QS4Hana: ${has_qs4hana}    
     

Check QS4Hana Version
    ${version}=    Evaluate    QS4Hana.__version__
    Log    QS4Hana Version: ${version}
 
 
Check QSAPR3 Version
    ${version}=    Evaluate    QSAPR3.__version__
    Log    QSAPR3 Version: ${version}     
