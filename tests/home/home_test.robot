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

HOM_05 - Verify that a user is subscribed to the newsletter
    [Documentation]    Positive Test Case:
    ...    This test case validates that the user is already subscribed to the 
    ...    Chilango newsletter
    ...    Expected Result: A confirmation page is displayed
    [Tags]    HOM    HOM_05    Regression    Smoke    UI
    ${USER_LOG} =     Collections.Get From Dictionary    ${USER}    ${ENVIRONMENT}
    home_page.Load Home Chilango Page
    home_page.Click On Newsletter Button
    home_page.Load Newsletter Chilango Page
    common_web.Get evidence
    home_page.Fill Email Input Text from Newsletter Page    ${USER_LOG}
    home_page.Click On Suscribirme Button from Newsletter Page
    home_page.Verify that a user is already subscribed to the newsletter
    common_web.Get evidence

HOM_06 - Verify that when user closes the banner it disappears
    [Documentation]    Positive Test Case:
    ...    This test case validates that when the user closes the banner,
    ...    it disappears from the home page
    ...    Expected Result: Banner is not displayed
    [Tags]    HOM    HOM_06    Regression    Smoke    UI
    ${USER_LOG} =     Collections.Get From Dictionary    ${USER}    ${ENVIRONMENT}
    home_page.Load Home Chilango Page
    common_web.Get evidence
    home_page.Click On Icon Close Button
    home_page.Verify That the Banner Has Disappeared
    common_web.Get evidence

HOM_07 - Verify that the Chilango Radio Button is Working
    [Documentation]    Positive Test Case:
    ...    This test case validates that when the user clicks on the radio Chilango button
    ...    the page is redirected to the Chilango Radio page
    ...    Expected Result: The Chilango Radio page is loading correctly
    [Tags]    HOM    HOM_07    Regression    Smoke    Sanity    UI
    home_page.Load Home Chilango Page
    common_web.Get evidence
    home_page.Click On Radio Chilango Button
    home_page.Switch to Radio Chilango Page
    home_page.Load Radio Chilango Home Page
    common_web.Get evidence

HOM_08 - Verify that when user closes the banner from radio Chilango it disappears
    [Documentation]    Positive Test Case:
    ...    This test case validates that when the user closes the banner,
    ...    it disappears from the radio Chilango page
    ...    Expected Result: Banner is not displayed
    [Tags]    HOM    HOM_08    Regression    Smoke    UI
    home_page.Load Home Chilango Page
    common_web.Get evidence
    home_page.Click On Radio Chilango Button
    home_page.Switch to Radio Chilango Page
    home_page.Load Radio Chilango Home Page
    common_web.Get evidence
    home_page.Click On Popup Close Button from Radio Chilango
    home_page.Verify That the Popup Has Disappeared
    common_web.Get evidence

HOM_09 - Verify that RC Player can be compressed and expanded
    [Documentation]    Positive Test Case:
    ...    This test case validates that when the user clicks on the button
    ...    to compress the RC Player, it is compressed
    ...    After this, user can expand it by clicking on the RC Player button
    ...    Expected Result: RC Player is compressed and expanded
    [Tags]    HOM    HOM_09    Regression    Smoke    UI
    home_page.Load Home Chilango Page
    common_web.Get evidence
    home_page.Close RC Player Music from Radio Chilango
    common_web.Get evidence
    home_page.Open RC Player Music from Radio Chilango
    common_web.Get evidence

HOM_10 - Verify that the user can play or pause the RC Player
    [Documentation]    Positive Test Case:
    ...    This test case validates that the user can play the RC player
    ...    and then pause it
    ...    Expected Result: Play and pause button from RC Player is working
    [Tags]    HOM    HOM_10    Regression    Smoke    UI
    home_page.Load Home Chilango Page
    common_web.Get evidence
    home_page.Click On Play Music from Radio Chilango
    home_page.Verify That the Play Button Has Changed to Pause
    common_web.Get evidence
    home_page.Click On Pause Music from Radio Chilango
    home_page.Verify That the Play Button Has Changed to Play
    common_web.Get evidence
