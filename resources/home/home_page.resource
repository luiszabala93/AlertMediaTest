*** Settings ***
Library      Selenium2Library
Library      ../../libraries/create_xpath.py
Variables    ./home_locators.yaml

*** Variables ***
${TIME} =       10s
${SH_TIME} =    1s
${ENVIRONMENT}

*** Keywords ***
