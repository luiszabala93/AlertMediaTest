*** Settings ***
Documentation    This test suite validates login page from Chilango site
...    Chilango Login Page  ->  https://login.chilango.com/

Library     Selenium2Library
Library     Collections
Library     ../../libraries/form_functions.py

Resource    ../../data/credential_user.robot
Resource    ../../data/platform_urls.robot
Resource    ../../resources/common_web.resource
Resource    ../../resources/login/login_page.resource

Test Setup       Begin Web Test    ${TEST_DATA_PATH}
Test Teardown    End Web Test

*** Variables ***
${TEST_DATA_PATH} =    login
${LONG_TIME} =         10s
${SHORT_TIME} =        1s

#To run
#robot -d results -i LOG -v ENVIRONMENT:PROD -v REPORT:FALSE -v BROWSER:chrome .
#pabot --testlevelsplit --processes 8 -d results -i LOG -v ENVIRONMENT:PROD -v REPORT:FALSE -v BROWSER:chrome .
#pabot --testlevelsplit --verbose --processes 8 -d results -i LOG -v ENVIRONMENT:PROD -v REPORT:FALSE -v BROWSER:chrome .

*** Test Cases ***
LOG_01 - Verify that the login page loads correct
    [Documentation]    Positive Test Case:
    ...    This test case validate that the login page loads correctly
    ...    Expected Result: Chilango login page is loading correctly
    [Tags]    LOG    LOG_01    Regression    Smoke    Sanity    UI
    login_page.Load Chilango Login Page
    common_web.Get evidence

LOG_02 - Verify that the email is not registered
    [Documentation]    Positive Test Case:
    ...    This test case validates that when entering an unregistered email,
    ...    an error message is displayed.
    ...    Expected Result: The create account page is loaded and an error
    ...    message is displayed
    [Tags]    LOG    LOG_02    Regression    Smoke    UI
    ${USER_LOG} =    Collections.Get From Dictionary    ${USER}    WRONG
    ${PASS_LOG} =    Collections.Get From Dictionary    ${PASS}    WRONG
    login_page.Load Chilango Login Page
    common_web.Get evidence
    login_page.Fill User Textbox    ${USER_LOG}
    login_page.Fill Pass Textbox    ${PASS_LOG}
    common_web.Get evidence
    login_page.Click On Login Button
    login_page.Load Chilando Register Page
    login_page.Verify message that the email is not registered
    common_web.Get evidence

LOG_03 - Verify that the registration form can be filled out
    [Documentation]    Positive Test Case:
    ...    This test case validates that the registration form can be filled
    ...    out correctly.
    ...    Expected Result: Data is entered correctly in the registration form
    [Tags]    LOG    LOG_03    Regression    Smoke    UI
    ${USER_LOG} =     Collections.Get From Dictionary    ${USER}    ${ENVIRONMENT}
    ${PASS_LOG} =     Collections.Get From Dictionary    ${PASS}    ${ENVIRONMENT}
    ${NAME} =         form_functions.Generate Random Name
    ${LAST_NAME} =    form_functions.Generate Random Last Name
    ${GENDER} =       form_functions.Generate Random Gender
    ${DATE} =         form_functions.Generate Random Date
    ${MOBILE} =       form_functions.Generate Random Phone Number
    login_page.Load Chilango Login Page
    login_page.Click On Registrate Button
    login_page.Load Chilando Register Page
    common_web.Get evidence
    login_page.Fill User Textbox                    ${USER_LOG}
    login_page.Fill User Confirmation Textbox       ${USER_LOG}
    login_page.Fill First Name Textbox              ${NAME}
    login_page.Fill Last Name Textbox               ${LAST_NAME}
    login_page.Select Gender                        ${GENDER}
    login_page.Fill Birth Day Textbox               ${DATE}
    login_page.Fill Mobile Textbox                  ${MOBILE}
    login_page.Fill Pass Textbox                    ${PASS_LOG}
    login_page.Fill Pass Confirmation Textbox       ${PASS_LOG}
    login_page.Click On Policy Checkbox
    common_web.Get evidence

LOG_04 - Verify that the email has not been confirmed
    [Documentation]    Positive Test Case:
    ...    This test case validates that the email has not been confirmed
    ...    Expected Result: An error message is displayed indicating that
    ...    the email has not been confirmed from the email
    [Tags]    LOG    LOG_04    Regression    Smoke    UI
    ${USER_LOG} =     Collections.Get From Dictionary    ${USER}    ${ENVIRONMENT}
    ${PASS_LOG} =     Collections.Get From Dictionary    ${PASS}    ${ENVIRONMENT}
    login_page.Load Chilango Login Page
    login_page.Fill User Textbox    ${USER_LOG}
    login_page.Fill Pass Textbox    ${PASS_LOG}
    login_page.Click On Login Button
    login_page.Verify message that the email is not confirmed
    common_web.Get evidence

LOG_05 - Verify that the password is not correct
    [Documentation]    Positive Test Case:
    ...    This test case validates that the password is not correct
    ...    Expected Result: An error message is displayed indicating that
    ...    the email or password are incorrect
    [Tags]    LOG    LOG_05    Regression    Smoke    UI
    ${USER_LOG} =     Collections.Get From Dictionary    ${USER}    ${ENVIRONMENT}
    ${PASS_LOG} =     Collections.Get From Dictionary    ${PASS}    WRONG
    login_page.Load Chilango Login Page
    login_page.Fill User Textbox    ${USER_LOG}
    login_page.Fill Pass Textbox    ${PASS_LOG}
    login_page.Click On Login Button
    login_page.Verify message that the email or password are incorrect
    common_web.Get evidence

LOG_06 - Verify new account registration
    [Documentation]    Positive Test Case:
    ...    This test case performs the flow to create a new account from scratch
    ...    Expected Result: A mail confirmation message is displayed correctly
    [Tags]    LOG    LOG_06    Regression    Smoke    UI
    ${PASS_LOG} =     Collections.Get From Dictionary    ${PASS}    ${ENVIRONMENT}
    ${NAME} =         form_functions.Generate Random Name
    ${LAST_NAME} =    form_functions.Generate Random Last Name
    ${USER_LOG} =     form_functions.Generate Random Email    ${NAME}    ${LAST_NAME}
    ${GENDER} =       form_functions.Generate Random Gender
    ${DATE} =         form_functions.Generate Random Date
    ${MOBILE} =       form_functions.Generate Random Phone Number
    login_page.Load Chilango Login Page
    login_page.Click On Registrate Button
    login_page.Load Chilando Register Page
    login_page.Fill User Textbox                    ${USER_LOG}
    login_page.Fill User Confirmation Textbox       ${USER_LOG}
    login_page.Fill First Name Textbox              ${NAME}
    login_page.Fill Last Name Textbox               ${LAST_NAME}
    login_page.Select Gender                        ${GENDER}
    login_page.Fill Birth Day Textbox               ${DATE}
    login_page.Fill Mobile Textbox                  ${MOBILE}
    login_page.Fill Pass Textbox                    ${PASS_LOG}
    login_page.Fill Pass Confirmation Textbox       ${PASS_LOG}
    login_page.Click On Policy Checkbox
    common_web.Get evidence
    login_page.Click On Create Button
    login_page.Load Chilango Preferences Page 1
    common_web.Get evidence
    login_page.Click On Next Button From Preferences Page 1
    login_page.Load Chilango Preferences Page 2
    common_web.Get evidence
    login_page.Click On Register Button From Preferences Page 2
    login_page.Verify Confirmation Page            ${USER_LOG}
    common_web.Get evidence

LOG_07 - Verify that the password recovery option works
    [Documentation]    Positive Test Case:
    ...    This test case validates that the password recovery option works
    ...    Expected Result: A message that the email was sent is displayed
    [Tags]    LOG    LOG_07    Regression    Smoke    UI
    ${USER_LOG} =     Collections.Get From Dictionary    ${USER}    ${ENVIRONMENT}
    ${PASS_LOG} =     Collections.Get From Dictionary    ${PASS}    ${ENVIRONMENT}
    login_page.Load Chilango Login Page
    login_page.Click On Forgot Button
    login_page.Load Chilango Forgot Password Page
    common_web.Get evidence
    login_page.Fill User Textbox                         ${USER_LOG}
    common_web.Get evidence
    login_page.Click On Continue Button
    login_page.Verify Email Send Confirmation Page       ${USER_LOG}
    common_web.Get evidence

LOG_08 - Verify message that the email does not exist from the forgot password page
    [Documentation]    Positive Test Case:
    ...    This test case validates that when using an email that does not exist,
    ...    an error message is displayed
    ...    Expected Result: An error message indicating that the email does not
    ...    exist is displayed
    [Tags]    LOG    LOG_08    Regression    Smoke    UI
    ${USER_LOG} =     Collections.Get From Dictionary    ${USER}    WRONG
    ${PASS_LOG} =     Collections.Get From Dictionary    ${PASS}    ${ENVIRONMENT}
    login_page.Load Chilango Login Page
    login_page.Click On Forgot Button
    login_page.Load Chilango Forgot Password Page
    common_web.Get evidence
    login_page.Fill User Textbox                              ${USER_LOG}
    common_web.Get evidence
    login_page.Click On Continue Button
    login_page.Verify message that email is not registered    ${USER_LOG}
    common_web.Get evidence
