*** Settings ***
Documentation        Cenários de teste do Login SAC

Resource        ../resources/Base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve logar como gestor de academia   

    Go to login page
    Submit login form    sac@smartbit.com   pwd123
    User is logged in    sac@smartbit.com

Não deve logar com senha incorreta
    [Tags]    inv_pass
    Go to login page
    Submit login form    sac@smartbit.com    abc123
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Não deve logar com e-mail não cadastrado
    [Tags]    email_404
    Go to login page
    Submit login form    404@smartbit.com    abc123
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Tentativa de logar com dados incorretos
    [Template]    Login with verify notice
    ${EMPTY}    ${EMPTY}              Os campos email e senha são obrigatórios.
    ${EMPTY}    pwd123                Os campos email e senha são obrigatórios.
    sac@smartibt.com    ${EMPTY}      Os campos email e senha são obrigatórios.
    www.teste.com.br    pwd123        Oops! O email informado é inválido
    sac&gmail.com       pwd123        Oops! O email informado é inválido
    casdafdsfggfggrr    pwd123        Oops! O email informado é inválido
    fwefef4343wddf32    pwd123        Oops! O email informado é inválido
    $%#¨%$¨%¨%¨%&¨%*    pwd123        Oops! O email informado é inválido
    test*gmail.com      pwd123        Oops! O email informado é inválido
    yahoo.com@&*        pwd123        Oops! O email informado é inválido



*** Keywords ***
Login with verify notice
    [Arguments]    ${email}    ${password}    ${output_message}

    Go to login page
    Submit login form    ${email}    ${password}