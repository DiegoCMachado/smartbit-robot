*** Settings ***

Documentation    Ações e elementos da tela de Login

Library    AppiumLibrary

*** Keywords ***

Signin with Documentation
    [Arguments]        ${cpf}

    Input Text    xpath=//android.widget.EditText[@resource-id="ipAddress"]    172.29.48.1
    Input Text    xpath=//android.widget.EditText[@resource-id="cpf"]    ${cpf}

    Click Element    xpath=//android.widget.TextView[@text="Entrar"]