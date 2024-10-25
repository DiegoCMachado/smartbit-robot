*** Settings ***

Documentation    Suite de testes de Login

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown     Finish session

*** Test Cases ***
Deve logar com o cpf e IP

    ${data}    Get Json fixture    login
    Insert Membership    ${data}
    
    Signin with Documentation    ${data}[account][cpf]
    User is logged in

Não deve logar com cpf não cadastrado

    Signin with Documentation      87862615093
    Popup have text                Acesso não autorizado! Entre em contato com a central de atendimento
    
Não deve logar com cpf inválido
    [Tags]    temp
    Signin with Documentation      87862615091
    Popup have text                CPF inválido, tente novamente
