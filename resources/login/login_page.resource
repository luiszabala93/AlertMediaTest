*** Settings ***
Library      Selenium2Library
Library      ../../libraries/create_xpath.py
Variables    ./login_locators.yaml

*** Variables ***
${TIME} =       10s
${SH_TIME} =    1s
${ENVIRONMENT}

*** Keywords ***
Load Chilango Login Page
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    Wait Until Element Is Visible    ${login_locators.chilango_logo}             ${TIME}
    Wait Until Element Is Visible    ${login_locators.first_subtitle_label}      ${TIME}
    Wait Until Element Is Visible    ${login_locators.registrate_button}         ${TIME}
    Wait Until Element Is Visible    ${login_locators.second_subtitle_label}     ${TIME}
    Wait Until Element Is Visible    ${login_locators.user_textbox}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.pass_textbox}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.login_button}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.third_subtitle_label}      ${TIME}
    Wait Until Element Is Visible    ${login_locators.forgot_button}             ${TIME}

Click On Chilango Logo
    Wait Until Element Is Visible    ${login_locators.chilango_logo}             ${TIME}
    Click Element                    ${login_locators.chilango_logo}

Click On Registrate Button
    Wait Until Element Is Visible    ${login_locators.registrate_button}         ${TIME}
    Click Element                    ${login_locators.registrate_button}

Click On Login Button
    Wait Until Element Is Visible    ${login_locators.login_button}              ${TIME}
    Click Element                    ${login_locators.login_button}

Click On Forgot Button
    Wait Until Element Is Visible    ${login_locators.forgot_button}             ${TIME}
    Click Element                    ${login_locators.forgot_button}

Fill User Textbox
    [Arguments]    ${user}
    Wait Until Element Is Visible    ${login_locators.user_textbox}              ${TIME}
    Input Text                       ${login_locators.user_textbox}              ${user}

Fill Pass Textbox
    [Arguments]    ${pass}
    Wait Until Element Is Visible    ${login_locators.pass_textbox}              ${TIME}
    Input Text                       ${login_locators.pass_textbox}              ${pass}

Load Chilando Register Page
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    Wait Until Element Is Visible    ${login_locators.chilango_logo}             ${TIME}
    Wait Until Element Is Visible    ${login_locators.create_account_title}      ${TIME}
    Wait Until Element Is Visible    ${login_locators.user_textbox}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.user_conf_textbox}         ${TIME}
    Wait Until Element Is Visible    ${login_locators.first_name_textbox}        ${TIME}
    Wait Until Element Is Visible    ${login_locators.last_name_textbox}         ${TIME}
    Wait Until Element Is Visible    ${login_locators.gender_select}             ${TIME}
    Wait Until Element Is Visible    ${login_locators.birth_day_textbox}         ${TIME}
    Wait Until Element Is Visible    ${login_locators.mobile_textbox}            ${TIME}
    Wait Until Element Is Visible    ${login_locators.pass_textbox}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.pass_conf_textbox}         ${TIME}
    Wait Until Element Is Visible    ${login_locators.policy_checkbox}           ${TIME}
    Wait Until Element Is Visible    ${login_locators.create_button}             ${TIME}
    Wait Until Element Is Visible    ${login_locators.four_subtitle_label}       ${TIME}
    Wait Until Element Is Visible    ${login_locators.login_sub_button}          ${TIME}

Fill User Confirmation Textbox
    [Arguments]    ${user}
    Wait Until Element Is Visible    ${login_locators.user_conf_textbox}         ${TIME}
    Input Text                       ${login_locators.user_conf_textbox}         ${user}

Fill First Name Textbox
    [Arguments]    ${name}
    Wait Until Element Is Visible    ${login_locators.first_name_textbox}        ${TIME}
    Input Text                       ${login_locators.first_name_textbox}        ${name}

Fill Last Name Textbox
    [Arguments]    ${last_name}
    Wait Until Element Is Visible    ${login_locators.last_name_textbox}         ${TIME}
    Input Text                       ${login_locators.last_name_textbox}         ${last_name}

Select Gender
    [Documentation]    This keyword selects the gender of the user
    ...    Here user can't use the traditional Select From List By ***
    ...    because it is an option, so it has to build the xpath
    [Arguments]    ${gender}
    Wait Until Element Is Visible    ${login_locators.gender_select}             ${TIME}
    # Select From List By Label        ${gender}
    Click Element                    ${login_locators.gender_select}
    ${XPATH} =    create_xpath.Obtain Xpath Gender Selector                      ${gender}
    Wait Until Element Is Visible    ${XPATH}
    Click Element                    ${XPATH}

Fill Birth Day Textbox
    [Arguments]    ${birth_day}
    Wait Until Element Is Visible    ${login_locators.birth_day_textbox}         ${TIME}
    Click Element                    ${login_locators.birth_day_textbox}
    Input Text                       ${login_locators.birth_day_textbox}         ${birth_day}

Fill Mobile Textbox
    [Arguments]    ${mobile}
    Wait Until Element Is Visible    ${login_locators.mobile_textbox}            ${TIME}
    Input Text                       ${login_locators.mobile_textbox}            ${mobile}

Fill Pass Confirmation Textbox
    [Arguments]    ${pass}
    Wait Until Element Is Visible    ${login_locators.pass_conf_textbox}         ${TIME}
    Input Text                       ${login_locators.pass_conf_textbox}         ${pass}

Click On Policy Checkbox
    [Documentation]    This keyword clicks on the policy checkbox
    ...    but the checkbox does not have a FALSE or TRUE identifier
    Wait Until Element Is Visible    ${login_locators.policy_checkbox}           ${TIME}
    Click Element                    ${login_locators.policy_checkbox}

Click On Conditions Subtitle Button
    Wait Until Element Is Visible    ${login_locators.conditions_sub_button}     ${TIME}
    Click Element                    ${login_locators.conditions_sub_button}

Click On Policies Subtitle Button
    Wait Until Element Is Visible    ${login_locators.policies_sub_button}       ${TIME}
    Click Element                    ${login_locators.policies_sub_button}

Click On Create Button
    Wait Until Element Is Visible    ${login_locators.create_button}             ${TIME}
    Click Element                    ${login_locators.create_button}

Click On Login Subitle Button
    Wait Until Element Is Visible    ${login_locators.login_sub_button}          ${TIME}
    Click Element                    ${login_locators.login_sub_button}

Verify message that the email is not registered
    Wait Until Element Is Visible    ${login_locators.unregistered_mail_message}    ${TIME}

Verify message that the email is not confirmed
    Wait Until Element Is Visible    ${login_locators.unconfirmed_mail_message}     ${TIME}

Verify message that the email or password are incorrect
    Wait Until Element Is Visible    ${login_locators.pass_wrong_message}        ${TIME}

Load Chilango Preferences Page 1
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    Wait Until Element Is Visible    ${login_locators.preferences_title}         ${TIME}
    Wait Until Element Is Visible    ${login_locators.step1_subtitle_label}      ${TIME}
    Wait Until Element Is Visible    ${login_locators.categorias_title}          ${TIME}
    Wait Until Element Is Visible    ${login_locators.cine_button}               ${TIME}
    Wait Until Element Is Visible    ${login_locators.noche_button}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.gastronomia_button}        ${TIME}
    Wait Until Element Is Visible    ${login_locators.musica_title}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.pop_button}                ${TIME}
    Wait Until Element Is Visible    ${login_locators.rock_button}               ${TIME}
    Wait Until Element Is Visible    ${login_locators.electronica_button}        ${TIME}
    Wait Until Element Is Visible    ${login_locators.salsa_button}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.indie_button}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.reggaeton_button}          ${TIME}
    Wait Until Element Is Visible    ${login_locators.jazz_button}               ${TIME}
    Wait Until Element Is Visible    ${login_locators.regional_button}           ${TIME}
    Wait Until Element Is Visible    ${login_locators.vida_local_title}          ${TIME}
    Wait Until Element Is Visible    ${login_locators.bazar_button}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.teatro_title}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.standup_button}            ${TIME}
    Wait Until Element Is Visible    ${login_locators.musicales_button}          ${TIME}
    Wait Until Element Is Visible    ${login_locators.drama_button}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.comedia_button}            ${TIME}
    Wait Until Element Is Visible    ${login_locators.performance_button}        ${TIME}
    Wait Until Element Is Visible    ${login_locators.ciencia_ficcion_button}    ${TIME}
    Wait Until Element Is Visible    ${login_locators.ferias_title}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.gastronomica_button}       ${TIME}
    Wait Until Element Is Visible    ${login_locators.artesanias_button}         ${TIME}
    Wait Until Element Is Visible    ${login_locators.libro_button}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.historia_button}           ${TIME}
    Wait Until Element Is Visible    ${login_locators.arte_title}                ${TIME}
    Wait Until Element Is Visible    ${login_locators.exposiciones_button}       ${TIME}
    Wait Until Element Is Visible    ${login_locators.museos_button}             ${TIME}
    Wait Until Element Is Visible    ${login_locators.galerias_button}           ${TIME}
    Wait Until Element Is Visible    ${login_locators.actividades_arte_button}    ${TIME}
    Wait Until Element Is Visible    ${login_locators.cultura_title}             ${TIME}
    Wait Until Element Is Visible    ${login_locators.danza_button}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.opera_button}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.festival_button}           ${TIME}
    Wait Until Element Is Visible    ${login_locators.moda_button}               ${TIME}
    Wait Until Element Is Visible    ${login_locators.literatura_button}         ${TIME}
    Wait Until Element Is Visible    ${login_locators.deportes_title}            ${TIME}
    Wait Until Element Is Visible    ${login_locators.automovilismo_button}      ${TIME}
    Wait Until Element Is Visible    ${login_locators.atletismo_button}          ${TIME}
    Wait Until Element Is Visible    ${login_locators.golf_button}               ${TIME}
    Wait Until Element Is Visible    ${login_locators.tenis_button}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.box_button}                ${TIME}
    Wait Until Element Is Visible    ${login_locators.artes_marciales_button}    ${TIME}
    Wait Until Element Is Visible    ${login_locators.beisbol_button}            ${TIME}
    Wait Until Element Is Visible    ${login_locators.futbol_soccer_button}      ${TIME}
    Wait Until Element Is Visible    ${login_locators.futbol_americano_button}    ${TIME}
    Wait Until Element Is Visible    ${login_locators.basquetbol_button}         ${TIME}
    Wait Until Element Is Visible    ${login_locators.other_title}               ${TIME}
    Wait Until Element Is Visible    ${login_locators.ninos_button}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.pareja_button}             ${TIME}
    Wait Until Element Is Visible    ${login_locators.amigos_button}             ${TIME}
    Wait Until Element Is Visible    ${login_locators.natural_button}            ${TIME}
    Wait Until Element Is Visible    ${login_locators.next_button}               ${TIME}

Click On Next Button From Preferences Page 1
    Wait Until Element Is Visible    ${login_locators.next_button}               ${TIME}
    Click Element                    ${login_locators.next_button}

Load Chilango Preferences Page 2
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    Wait Until Element Is Visible    ${login_locators.step2_subtitle_label}      ${TIME}
    Wait Until Element Is Visible    ${login_locators.question1_label}           ${TIME}
    Wait Until Element Is Visible    ${login_locators.diario_button}             ${TIME}
    Wait Until Element Is Visible    ${login_locators.semanal_button}            ${TIME}
    Wait Until Element Is Visible    ${login_locators.quincenal_button}          ${TIME}
    Wait Until Element Is Visible    ${login_locators.mensual_button}            ${TIME}
    Wait Until Element Is Visible    ${login_locators.question2_label}           ${TIME}
    Wait Until Element Is Visible    ${login_locators.si_button}                 ${TIME}
    Wait Until Element Is Visible    ${login_locators.no_button}                 ${TIME}
    Wait Until Element Is Visible    ${login_locators.regis_button}              ${TIME}

Click On Register Button From Preferences Page 2
    Wait Until Element Is Visible    ${login_locators.regis_button}              ${TIME}
    Click Element                    ${login_locators.regis_button}

Verify Confirmation Page
    [Arguments]    ${email}
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    Wait Until Element Is Visible    ${login_locators.confirmation_title}        ${TIME}
    Wait Until Element Is Visible    ${login_locators.thanks_label}              ${TIME}
    ${XPATH} =    create_xpath.Obtain Xpath Confirmation Legend                  ${email}
    Wait Until Element Is Visible    ${XPATH}

Load Chilango Forgot Password Page
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    Wait Until Element Is Visible    ${login_locators.chilango_logo}             ${TIME}
    Wait Until Element Is Visible    ${login_locators.forgot_pass_title}         ${TIME}
    Wait Until Element Is Visible    ${login_locators.forgot_description_legend}    ${TIME}
    Wait Until Element Is Visible    ${login_locators.user_textbox}              ${TIME}
    Wait Until Element Is Visible    ${login_locators.continue_button}           ${TIME}
    Wait Until Element Is Visible    ${login_locators.four_subtitle_label}       ${TIME}
    Wait Until Element Is Visible    ${login_locators.login_sub_button}          ${TIME}

Click On Continue Button
    Wait Until Element Is Visible    ${login_locators.continue_button}           ${TIME}
    Click Element                    ${login_locators.continue_button}

Verify Email Send Confirmation Page
    [Arguments]    ${email}
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    Wait Until Element Is Visible    ${login_locators.sent_email_title}          ${TIME}
    ${XPATH} =    create_xpath.Obtain Xpath Confirmation Sent Email Legend       ${email}
    Wait Until Element Is Visible    ${XPATH}

Verify message that email is not registered
    [Arguments]    ${email}
    Wait For Condition               return document.readyState == "complete"    ${TIME}
    ${XPATH} =    create_xpath.Obtain Xpath Email Unregistered                   ${email}
    Wait Until Element Is Visible    ${XPATH}
