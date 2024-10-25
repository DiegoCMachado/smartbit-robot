*** Settings ***

Documentation        Ações e elementos da Landing ${PREV_TEST_MESSAGE}

Library        Browser

*** Keywords ***
Submit signup form
    [Arguments]        ${account}

    Get Text    css=#signup h2    
    ...    equals    
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name         ${account}[name]
    Fill Text    id=email        ${account}[email]
    Fill Text    id=cpf          ${account}[cpf]
    Click        css=button >> text=Cadastrar

