*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Variables   ../page_objects/Locators.py


*** Variables ***
${BROWSER}    chrome
${TIMEOUT}  10
${SCREENSHOT_FOLDER}  ./reports/screenshots/
${BASE_URL}   https://landmark.taqtics.co
${BASE_PATH}    C:/Users/Lenovo/Desktop/taqticsAssignment/automationTesting
${INVALID_USER}     wrong@email.co
${INVALID_USER_FORMAT}      @wrong.email.co
${INVALID_PASSWORD}    TestIntern@1234
${VALID_USER}    intern@taqtics.co
${VALID_PASSWORD}    TestIntern@123
${SPECIAL_CHARACTERS}   !@#$%^&*()_+{}|\][":;'?><,./
${VALID_USER_NAME}    Intern
${INVALID_FORMAT_ERROR}    Please input valid email!
${EMPTY_STRING}     ${EMPTY}
${EMPTY_EMAIL_TOAST}    Please input your email!
${EMPTY_PASSWORD_TOAST}    Please input your Password!
${INVALID_PASSWORD_TOAST}    Invalid Credentials!
${INVALID_CREDENTIALS_TOAST}    Not Found

*** Keywords ***
Open my browser
    [Arguments]    ${URL}    ${browser}
    Open Browser   ${URL}    ${browser}
    Maximize Browser Window
    Run Keyword And Continue On Failure     Wait Until Element Is Visible    ${loginForm}    timeout=${TIMEOUT}
    Log    Browser opened and maximized successfully.

Enter email
    [Arguments]    ${emailId}
    Run Keyword And Continue On Failure     Wait Until Element Is Visible    ${inputEmail}    timeout=${TIMEOUT}
    Run Keyword And Continue On Failure     Input Text     ${inputEmail}    ${emailId}
    Log    Entered email: ${emailId}

Enter password
    [Arguments]    ${password}
    Run Keyword And Continue On Failure     Wait Until Element Is Visible    ${inputPassword}    timeout=${TIMEOUT}
    Run Keyword And Continue On Failure     Input Text     ${inputPassword}    ${password}
    Log    Entered password.

Click Log In
    Run Keyword And Continue On Failure     Wait Until Element Is Visible    ${loginButton}    timeout=${TIMEOUT}
    Run Keyword And Continue On Failure     Wait Until Element Is Enabled    ${loginButton}    timeout=${TIMEOUT}
    Click Button    ${loginButton}
    Log    Attempted to click login button.

Logout from browser
    [Arguments]    ${nameOfTheUser}
    Run Keyword And Continue On Failure     Wait Until Element Is Visible    ${userName}     timeout=${timeOut}
    Run Keyword And Continue On Failure     Wait Until Element Is Enabled    ${userName}     timeout=${timeOut}
    Click Element    ${userName}
    Log    Clicked on user profile.

    Run Keyword And Continue On Failure     Wait Until Element Is Visible    ${logOut}    timeout=${timeOut}
    Run Keyword And Continue On Failure     Wait Until Element Is Enabled    ${logOut}    timeout=${timeOut}
    Click Element    ${logOut}
    Wait Until Element Is Enabled    ${loginForm}
    Element Should Be Visible    ${loginForm}
    Log    Logout successful

Verify Successful Login
    [Arguments]    ${nameOfTheUser}
    Run Keyword And Continue On Failure     Wait Until Element Is Visible   ${userName}    timeout=${timeOut}
    Run Keyword And Continue On Failure     Element Should Contain    ${userName}    ${nameOfTheUser}
    Log    Successfully verified login for user: ${nameOfTheUser}

Verify email validation error message
    [Arguments]    ${errorMessage}
    Run Keyword And Continue On Failure     Wait Until Element Is Visible    ${emailErrorMessage}    timeout=${timeOut}
    Run Keyword And Continue On Failure     Element Should Contain    ${emailErrorMessage}    ${errorMessage}
    Log    Verified email error message: ${errorMessage}

Verify password validation error message
    [Arguments]    ${errorMessage}
    Run Keyword And Continue On Failure     Wait Until Element Is Visible    ${passwordErrorMessage}    timeout=${timeOut}
    Run Keyword And Continue On Failure     Element Should Contain    ${passwordErrorMessage}    ${errorMessage}
    Log    Verified password validation error message is: ${errorMessage}

Verify error toast message
    [Arguments]    ${errorMessage}
    Run Keyword And Continue On Failure     Wait Until Element Is Visible    ${toastMessage}    timeout=${timeOut}
    Run Keyword And Continue On Failure     Element Should Contain    ${toastMessage}    ${errorMessage}
    Log    Verified toast error message is: ${errorMessage}
