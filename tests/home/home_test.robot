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

Test Setup       Begin Web Test    ${TEST_DATA_PATH}
Test Teardown    End Web Test

*** Variables ***
${TEST_DATA_PATH} =    home
${LONG_TIME} =         10s
${SHORT_TIME} =        1s

*** Test Cases ***
