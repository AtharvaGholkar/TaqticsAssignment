*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${BASE_URL}   https://landmark.taqtics.co
${BASE_PATH}    C:/Users/Lenovo/Desktop/taqticsAssignment/automationTesting
${INVALID_USER}     wrong@email.co
${INVALID_USER_FORMAT}      @wrong.email.co
${INVALID_PASSWORD}    TestIntern@1234
${VALID_USER}    intern@taqtics.co
${VALID_PASSWORD}    TestIntern@123
${SPECIAL_CHARACTERS}   !@#$%^&*()_+{}|\][":;'?><,./
${AUTH_END_POINT}   /v1/external/generateAuthToken
${TIMEOUT}  30
${200}      200
${400}      400
${401}      401
${403}      403
${404}      404
${400_BAD_REQUEST_EMAIL}  \\\"Email\\\" is not allowed to be empty
${400_BAD_REQUEST_PASSWORD}   \\\"Password\\\" is not allowed to be empty
${401_UNAUTHORIZED}    Invalid Credentials!
${403_FORBIDDEN}    Forbidden
${404_NOT_FOUND}    User not found

*** Keywords ***
Create Api Session
    [Arguments]    ${url}
    Create Session    api_session    ${url}     verify=true
    Log    API session created successfully.

Send Post Request For Auth
    [Arguments]    ${url}    ${username}    ${password}
    ${body}=    Create Dictionary    email=${username}    password=${password}
    ${response}=     POST On Session    api_session    ${url}    data=${body}       expected_status=any
    Log    Received response with status code: ${response.status_code}
    Log    Response content: ${response.content}
    Return From Keyword    ${response}

Check if status code is 200
    [Arguments]    ${actual_status_code}
    Convert To String    ${actual_status_code}
    Log    Actual status code: ${actual_status_code}
    Run Keyword If    ${actual_status_code} == ${200}  Fail     Status code should not be 200. It should be either 400,401 or 403 depending upon the api documentation.

Check Status Code
    [Arguments]    ${actual_status_code}    ${expected_status_code}
    Log    Actual status code: ${actual_status_code}
    Log    Expected status code: ${expected_status_code}
    Should Be Equal As Integers    ${actual_status_code}    ${expected_status_code}

Check Error Message
    [Arguments]    ${actual_response_content}    ${expected_error_message}
    Log    Actual response content: ${actual_response_content}
    Log    Expected error message: ${expected_error_message}
    Should Contain    ${actual_response_content}     ${expected_error_message}
