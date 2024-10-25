*** Settings ***
Documentation        Teste para verificar o Slogan da Smartibit na Webapp

Library        Browser

*** Test Cases ***
Deve exibir o Slogan na Landing Page
     New Browser    browser=chromium    headless=False
     New Page    http://localhost:3000
     Get Text    css=.headline h2    equals    Sua Jornada Fitness Começa aqui!
