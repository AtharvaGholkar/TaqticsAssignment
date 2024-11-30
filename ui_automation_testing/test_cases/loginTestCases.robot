*** Settings ***
Library  SeleniumLibrary
Resource   ../resources/loginPageKeywords.robot
Test Setup    Open my browser    ${BASE_URL}    ${BROWSER}
Test Teardown    Close Browser

*** Test Cases ***
Verify successful login with correct credentials
    [Tags]    positive    login
    [Documentation]    Verify that a valid user can successfully log in.
    Enter email    ${VALID_USER}
    Enter password    ${VALID_PASSWORD}
    Click Log In
    Verify Successful Login    ${VALID_USER_NAME}
    Logout from browser    ${VALID_USER_NAME}

Verify error message for invalid email syntax
    [Tags]    negative    login
    [Documentation]    Verify the error message when an invalid email syntax is entered.
    Enter email    ${INVALID_USER_FORMAT}
    Verify email validation error message    ${INVALID_FORMAT_ERROR}

Verify error message when both email and password fields are empty
    [Tags]    negative    login
    [Documentation]    Verify error messages when both email and password fields are left empty.
    Enter email    ${EMPTY_STRING}
    Enter password    ${EMPTY_STRING}
    Click Log In
    Verify email validation error message    ${EMPTY_EMAIL_TOAST}
    Verify password validation error message   ${EMPTY_PASSWORD_TOAST}

Verify toast message for invalid email and invalid password combination
    [Tags]    negative    login
    [Documentation]    Verify error message when an invalid email and a valid password combination is used.
    Enter email    ${INVALID_USER}
    Enter password    ${INVALID_PASSWORD}
    Click Log In
    Verify error toast message    ${INVALID_CREDENTIALS_TOAST}

Verify toast message for incorrect password with correct email
    [Tags]    negative    login
    [Documentation]    Verify error message when a correct email and an incorrect password combination is used.
    Enter email    ${VALID_USER}
    Enter password   ${INVALID_PASSWORD}
    Click Log In
    Verify error toast message    ${INVALID_PASSWORD_TOAST}
