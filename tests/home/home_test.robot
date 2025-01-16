*** Settings ***
Documentation    This test suite validates home page from Chilango site
...    Chilango Home Page  ->  https://www.chilango.com/

Library     Selenium2Library
Library     Collections
Library     ../../libraries/form_functions.py

Resource    ../../data/credential_user.robot
Resource    ../../data/platform_urls.robot
Resource    ../../resources/common_web.resource
Resource    ../../resources/home/home_page.resource
Resource    ../../resources/login/login_page.resource

Test Setup       Begin Web Test    ${TEST_DATA_PATH}
Test Teardown    End Web Test

*** Variables ***
${TEST_DATA_PATH} =    home
${LONG_TIME} =         10s
${SHORT_TIME} =        1s
${PAGE} =              TRUE

#To run
#robot -d results -i HOM -v ENVIRONMENT:PROD -v REPORT:FALSE -v BROWSER:chrome .
#pabot --testlevelsplit --processes 8 -d results -i HOM -v ENVIRONMENT:PROD -v REPORT:FALSE -v BROWSER:chrome .
#pabot --testlevelsplit --verbose --processes 8 -d results -i HOM -v ENVIRONMENT:PROD -v REPORT:FALSE -v BROWSER:chrome .

*** Test Cases ***
HOM_01 - Verify that the Inicia Sesion Button is Working
    [Documentation]    Positive Test Case:
    ...    This test case validates that when the user clicks on the INICIA SESIÓN button
    ...    the page is redirected to the login page of the Chilango site
    ...    Expected Result: The login page is loading correctly
    [Tags]    HOM    HOM_01    Regression    Smoke    UI
    home_page.Load Home Chilango Page
    common_web.Get evidence
    home_page.Click On Inicia Sesion Button
    login_page.Load Chilango Login Page
    common_web.Get evidence

HOM_02 - Verify that the home page loads correctly
    [Documentation]    Positive Test Case:
    ...    This test case validate that the home page loads correctly
    ...    Expected Result: Chilango home page is loading correctly
    [Tags]    HOM    HOM_02    Regression    Smoke    Sanity    UI
    home_page.Load Home Chilango Page
    common_web.Get evidence

HOM_03 - Verify that the Newsletter Button is Working
    [Documentation]    Positive Test Case:
    ...    This test case validates that when the user clicks on the NEWSLETTER button
    ...    the page is redirected to the newsletter page of the Chilango site
    ...    Expected Result: The newsletter page is loading correctly
    [Tags]    HOM    HOM_03    Regression    Smoke    Sanity    UI
    home_page.Load Home Chilango Page
    common_web.Get evidence
    home_page.Click On Newsletter Button
    home_page.Load Newsletter Chilango Page
    common_web.Get evidence

HOM_04 - Verify that user can subscribe to the newsletter
    [Documentation]    Positive Test Case:
    ...    This test case validates that the user can subscribe to the
    ...    Chilango newsletter
    ...    Expected Result: A confirmation page is displayed
    [Tags]    HOM    HOM_04    Regression    Smoke    UI
    ${NAME} =         form_functions.Generate Random Name
    ${LAST_NAME} =    form_functions.Generate Random Last Name
    ${USER_LOG} =     form_functions.Generate Random Email    ${NAME}    ${LAST_NAME}
    home_page.Load Home Chilango Page
    home_page.Click On Newsletter Button
    home_page.Load Newsletter Chilango Page
    common_web.Get evidence
    home_page.Fill Email Input Text from Newsletter Page    ${USER_LOG}
    common_web.Get evidence
    home_page.Click On Suscribirme Button from Newsletter Page
    home_page.Load Newsletter Subscribe Chilango Page
    common_web.Get evidence
    home_page.Click On Save Preferences Button from Newsletter Page
    home_page.Verify That User Is Subscribed to the Newsletter
    common_web.Get evidence
