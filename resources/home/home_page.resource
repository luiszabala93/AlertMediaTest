*** Settings ***
Library      Selenium2Library
Library      ../../libraries/create_xpath.py
Variables    ./home_locators.yaml

*** Variables ***
${TIME} =       10s
${SH_TIME} =    1s
${ENVIRONMENT}

*** Keywords ***
Load Home Chilango Page
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    Wait Until Element Is Visible    ${home_locators.icon_close_button}          ${TIME}
    Wait Until Element Is Visible    ${home_locators.rc_player_button}           ${TIME}
    Wait Until Element Is Visible    ${home_locators.rc_player_close_button}     ${TIME}
    Wait Until Element Is Visible    ${home_locators.rc_play_button}             ${TIME}
    Wait Until Element Is Visible    ${home_locators.radio_chilango_button}      ${TIME}
    Wait Until Element Is Visible    ${home_locators.inicia_sesion_button}       ${TIME}
    Wait Until Element Is Visible    ${home_locators.chilango_home_logo}         ${TIME}
    Wait Until Element Is Visible    ${home_locators.newsletter_button}          ${TIME}
    Wait Until Element Is Visible    ${home_locators.search_button}              ${TIME}

Click On Icon Close Button
    Wait Until Element Is Visible    ${home_locators.icon_close_button}          ${TIME}
    Click Element                    ${home_locators.icon_close_button}

Verify That the Banner Has Disappeared
    Wait Until Element Is Not Visible    ${home_locators.icon_close_button}      ${TIME}
    Wait Until Element Is Not Visible    ${home_locators.banner_button}          ${TIME}

Click On Search Button
    Wait Until Element Is Visible    ${home_locators.search_button}              ${TIME}
    Click Element                    ${home_locators.search_button}

Load Search Form
    Wait Until Element Is Visible    ${home_locators.search_textbox}             ${TIME}
    Wait Until Element Is Visible    ${home_locators.buscar_button}              ${TIME}
    Wait Until Element Is Visible    ${home_locators.close_search_button}        ${TIME}

Close Search Form
    Wait Until Element Is Visible    ${home_locators.close_search_button}        ${TIME}
    Click Element                    ${home_locators.close_search_button}

Click On Search Button from Search Form
    Wait Until Element Is Visible    ${home_locators.buscar_button}              ${TIME}
    Click Element                    ${home_locators.buscar_button}

Fill Search Textbox
    [Arguments]    ${search_text}
    Wait Until Element Is Visible    ${home_locators.search_textbox}             ${TIME}
    Input Text                       ${home_locators.search_textbox}             ${search_text}

Click On Newsletter Button
    Wait Until Element Is Visible    ${home_locators.newsletter_button}          ${TIME}
    Click Element                    ${home_locators.newsletter_button}

Load Newsletter Chilango Page
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    Wait Until Element Is Visible    ${home_locators.chilango_newsletter_logo}    ${TIME}
    Wait Until Element Is Visible    ${home_locators.newsletter_title}           ${TIME}
    Wait Until Element Is Visible    ${home_locators.email_inputtext}            ${TIME}
    Wait Until Element Is Visible    ${home_locators.suscribirme_button}         ${TIME}

Click On Chilango Button from Newsletter Page
    Wait Until Element Is Visible    ${home_locators.chilango_newsletter_logo}    ${TIME}
    Click Element                    ${home_locators.chilango_newsletter_logo}

Fill Email Input Text from Newsletter Page
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${home_locators.email_inputtext}            ${TIME}
    Input Text                       ${home_locators.email_inputtext}            ${email}

Click On Suscribirme Button from Newsletter Page
    Wait Until Element Is Visible    ${home_locators.suscribirme_button}         ${TIME}
    Click Element                    ${home_locators.suscribirme_button}

Load Newsletter Subscribe Chilango Page
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    Wait Until Element Is Visible    ${home_locators.welcome_label}              ${TIME}
    Wait Until Element Is Visible    ${home_locators.data_title}                 ${TIME}
    Wait Until Element Is Visible    ${home_locators.themes_title}               ${TIME}
    Wait Until Element Is Visible    ${home_locators.save_preferences_button}    ${TIME}

Click On Save Preferences Button from Newsletter Page
    Wait Until Element Is Visible    ${home_locators.save_preferences_button}    ${TIME}
    Click Element                    ${home_locators.save_preferences_button}

Verify That User Is Subscribed to the Newsletter
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    Wait Until Element Is Visible    ${home_locators.thanks_newsletter_label}    ${TIME}
    Wait Until Element Is Visible    ${home_locators.thanks_newsletter_message}    ${TIME}
    Wait Until Element Is Visible    ${home_locators.back_home_button}           ${TIME}

Verify that a user is already subscribed to the newsletter
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    Wait Until Element Is Visible    ${home_locators.subscribed_newsletter_title}    ${TIME}
    Wait Until Element Is Visible    ${home_locators.edit_newsletter_button}     ${TIME}
    Wait Until Element Is Visible    ${home_locators.back_home_button}           ${TIME}

Click On Back Home Button from Newsletter Page
    Wait Until Element Is Visible    ${home_locators.back_home_button}           ${TIME}
    Click Element                    ${home_locators.back_home_button}

Click On Radio Chilango Button
    Wait Until Element Is Visible    ${home_locators.radio_chilango_button}      ${TIME}
    Click Element                    ${home_locators.radio_chilango_button}

Load Radio Chilango Home Page
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    Wait Until Element Is Visible    ${home_locators.popup_publish}              ${TIME}
    Wait Until Element Is Visible    ${home_locators.popup_close_button}         ${TIME}

Switch to Radio Chilango Page
    Switch Window    title=Radio Chilango

Switch to Chilango Home Page
    Switch Window    url=https://www.chilango.com/

Click On Play Music from Radio Chilango
    Wait Until Element Is Visible    ${home_locators.rc_play_button}             ${TIME}
    Click Element                    ${home_locators.rc_play_button}
    Wait Until Element Is Visible    ${home_locators.rc_pause_button}            ${TIME}

Click On Pause Music from Radio Chilango
    Wait Until Element Is Visible    ${home_locators.rc_pause_button}            ${TIME}
    Click Element                    ${home_locators.rc_pause_button}
    Wait Until Element Is Visible    ${home_locators.rc_play_button}             ${TIME}

Close Play Music from Radio Chilango
    Wait Until Element Is Visible    ${home_locators.rc_player_close_button}     ${TIME}
    Click Element                    ${home_locators.rc_player_close_button}
    Wait Until Element Is Visible    ${home_locators.rc_player_button_visible}    ${TIME}

Show Play Music from Radio Chilango
    Wait Until Element Is Visible    ${home_locators.rc_player_button_visible}    ${TIME}
    Click Element                    ${home_locators.rc_player_button_visible}
    Wait Until Element Is Visible    ${home_locators.rc_player_close_button}     ${TIME}

Click On Inicia Sesion Button
    Wait Until Element Is Visible    ${home_locators.inicia_sesion_button}       ${TIME}
    Click Element                    ${home_locators.inicia_sesion_button}
