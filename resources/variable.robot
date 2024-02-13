
*** Variables ***
# IMPORTANT: Please read the readme.txt to understand needed variables and how to handle them!!
${Country}            xpath=/html[1]/body[1]/div[3]/md-dialog[1]/md-dialog-content[1]/form[1]/md-card[1]/md-content[1]/div[1]/beneficiary-details[1]/div[1]/md-content[1]/md-input-container[1]/md-select[1]
${RecipientVendor}    xpath=/html[1]/body[1]/div[3]/md-dialog[1]/md-dialog-content[1]/form[1]/md-card[1]/md-content[1]/div[1]/beneficiary-details[1]/div[1]/md-content[1]/md-input-container[2]/md-select[1]
${BusinessKey}        xpath=/html[1]/body[1]/div[3]/md-dialog[1]/md-dialog-content[1]/form[1]/md-card[1]/md-content[1]/div[1]/beneficiary-details[1]/div[1]/md-content[1]/div[1]/md-input-container[1]/md-select[1]
${ProgrammeYear}      xpath=/html[1]/body[1]/div[3]/md-dialog[1]/md-dialog-content[1]/form[1]/md-card[1]/md-content[1]/div[1]/beneficiary-details[1]/div[1]/md-content[1]/md-input-container[3]/md-select[1]
${DecisionLetter}     xpath=/html[1]/body[1]/div[3]/md-dialog[1]/md-dialog-content[1]/form[1]/md-card[1]/md-content[1]/div[2]/wizard-documents[1]/div[1]/div[1]/div[3]/div[1]/file-button[1]/button[1]
${SelectFile}         xpath=/html[1]/body[1]/div[4]/md-dialog[1]/md-dialog-content[1]/div[1]/button[1]
${FILE}               FUNDAMENTALS .pdf
${STARTCDR}           xpath=//body/div[3]/md-dialog[1]/md-dialog-content[1]/form[1]/md-card[1]/div[2]/div[1]/div[2]/button[3]/div[1]