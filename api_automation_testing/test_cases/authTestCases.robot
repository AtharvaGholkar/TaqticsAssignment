*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    ../resources/authApiKeywords.robot
Test Setup  Create Api Session    ${BASE_URL}

*** Test Cases ***

Valid Authentication Attempt with Non-Admin Role
    [Documentation]    Verify that a non-admin user receives an error.
    ${RESPONSE}=    Send Post Request For Auth    ${AUTH_END_POINT}    ${VALID_USER}    ${VALID_PASSWORD}
    Check Status Code    ${RESPONSE.status_code}    ${403_FORBIDDEN}


Invalid Authentication Attempt with special character credentials
    [Documentation]    Verify that special character credentials are not crashing the api.
    ${RESPONSE}=    Send Post Request For Auth    ${AUTH_END_POINT}    ${SPECIAL_CHARACTERS}    ${SPECIAL_CHARACTERS}
    Check Status Code    ${RESPONSE.status_code}    ${404}
    Check Error Message    ${RESPONSE.content}    ${404_NOT_FOUND}

Invalid authentication attempt with Invalid credentials
    [Documentation]    Verify that incorrect credentials return an error.
    ${RESPONSE}=    Send Post Request For Auth     ${AUTH_END_POINT}    ${INVALID_USER}    ${INVALID_PASSWORD}
    Check Status Code    ${RESPONSE.status_code}    ${404}
    Check Error Message    ${RESPONSE.content}   ${404_NOT_FOUND}

Invalid authentication attempt with missing Credentials
    [Documentation]    Verify that missing credentials return an error.
    ${RESPONSE}=    Send Post Request For Auth     ${AUTH_END_POINT}    ${EMPTY}   ${EMPTY}
    Check Status Code    ${RESPONSE.status_code}    ${400}
    Check Error Message    ${RESPONSE.content}    ${400_BAD_REQUEST_EMAIL}

Invalid authentication attempt with invalid password
    [Documentation]    Verify that user is not able to login with valid email and invalid password.
    ${response}=    Send Post Request For Auth     ${AUTH_END_POINT}    ${VALID_USER}   ${INVALID_PASSWORD}
    Check Status Code    ${RESPONSE.status_code}    ${401}
    Check Error Message    ${RESPONSE.content}      ${401_UNAUTHORIZED}

Invalid authentication attempt with invalid email format
    [Documentation]    Verify that user is not able to login with invalid email format.
    ${response}=    Send Post Request For Auth     ${AUTH_END_POINT}    ${INVALID_USER_FORMAT}    ${INVALID_PASSWORD}
    Check Status Code    ${RESPONSE.status_code}    ${404}
    Check Error Message    ${RESPONSE.content}      ${404_NOT_FOUND}

Invalid authentication attempt with missing password
    [Documentation]    Verify that valid email and missing password return an error.
    ${RESPONSE}=    Send Post Request For Auth     ${AUTH_END_POINT}    ${VALID_USER}   ${EMPTY}
    Check Status Code    ${RESPONSE.status_code}    ${400}
    Check Error Message    ${RESPONSE.content}    ${400_BAD_REQUEST_PASSWORD}

Invalid autentication attempt with credentials as integers
    [Documentation]    Verify that credentials with integers return an error.
    ${INVALID_EMAIL}=    Set Variable    1234567890
    ${INVALID_PASSWORD}=    Set Variable    1234567
    ${RESPONSE}=   Send Post Request For Auth     ${AUTH_END_POINT}    ${INVALID_EMAIL}   ${INVALID_PASSWORD}
    Check Status Code    ${RESPONSE.status_code}    ${404}
    Check Error Message    ${RESPONSE.content}      ${404_NOT_FOUND}
