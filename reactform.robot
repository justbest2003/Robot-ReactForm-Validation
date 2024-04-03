*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}                  Chrome
${INPUT_FIRSTNAMEENG}       สมชาย
${INPUT_IDCARD}             000000000000
${INPUT_PASSWORD}           1111
${INPUT_PHONENUM}           2222222
${INPUT_EMAIL}              test@gmail.com

${RESULT_FIRSTNAMEENG}      Must be in English only
${RESULT_IDCARD}            Must be exactly 13 characters
${RESULT_PASSWORD}          Password must be at least 8 characters
${RESULT_PHONENUM}          Must be exactly 10 characters
${RESULT_EMAIL}             Email must contain specific domain name


*** Test Cases ***
Check Validation FirstnameEng
    [Documentation]    Test case to Check Validation FirstnameEnglish
    Open Google ReactForm
    Input FirstnameENG
    Click Element Field
    Verify FirstnameENG Results

Check Validation IDCard
    [Documentation]    Test case to Check Validation IDCard
    Open Google ReactForm
    Input IDCard
    Click Element Field
    Verify IDCard Results

Check Validation Password
    [Documentation]    Test case to Check Validation Password
    Open Google ReactForm
    Input Password
    Click Element Field
    Verify Password Results

Check Validation PhoneNumber
    [Documentation]    Test case to Check Validation PhoneNumber
    Open Google ReactForm
    Input PhoneNumber
    Click Element Field
    Verify PhoneNumber Results

Check Validation Email
    [Documentation]    Test case to Check Validation Email
    Open Google ReactForm
    Input Email
    Click Element Field
    Verify Email Results



*** Keywords ***
Open Google ReactForm
    Open Browser    https://react-form-validation-amber.vercel.app/    ${BROWSER}
    Maximize Browser Window

Input FirstnameENG
    Input Text    name=firstnameEng    ${INPUT_FIRSTNAMEENG}

Input IDCard
    Input Text    name=idCard    ${INPUT_IDCARD}

Input Password
    Input Text    name=password    ${INPUT_PASSWORD}

Input PhoneNumber
    Input Text    name=mobile    ${INPUT_PHONENUM}

Input Email
    Input Text    name=email    ${INPUT_EMAIL}

Click Element Field
    Click Element    xpath://input[@id='accept']

Verify FirstnameENG Results
    Wait Until Page Contains    ${RESULT_FIRSTNAMEENG}
    Page Should Contain    ${RESULT_FIRSTNAMEENG}

Verify IDCard Results
    Wait Until Page Contains    ${RESULT_IDCARD}
    Page Should Contain    ${RESULT_IDCARD}

Verify Password Results
    Wait Until Page Contains    ${RESULT_PASSWORD}
    Page Should Contain    ${RESULT_PASSWORD}

Verify PhoneNumber Results
    Wait Until Page Contains    ${RESULT_PHONENUM}
    Page Should Contain    ${RESULT_PHONENUM}

Verify Email Results
    Wait Until Page Contains    ${RESULT_EMAIL}
    Page Should Contain    ${RESULT_EMAIL}
