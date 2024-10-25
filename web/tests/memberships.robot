*** Settings ***
Documentation    Suite de testes de adesões de planos

Resource    ../resources/Base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão

    ${data}    Get Json fixture    memberships    create
    
    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]

    SignIn admin    
    Go to memberships
    Create new membership    ${data}    
    Toast should be    Matrícula cadastrada com sucesso.

    Sleep    3


Não deve realizar adesão duplicada
    [Tags]    dup
    ${data}    Get Json fixture    memberships    duplicate
    
    Insert membership    ${data}

    SignIn admin    
    Go to memberships
    Create new membership    ${data}
    Toast should be    O usuário já possui matrícula.   

Deve buscar por nome
    [Tags]    search
    
    ${data}    Get Json fixture    memberships    search

    Insert Membership    ${data}
    
    SignIn admin
    Go to memberships
    Serach by name           ${data}[account][name]
    Should filter by name    ${data}[account][name]

Deve excluir uma matrícula
    [Tags]    remove
    ${data}    Get Json fixture    memberships    remove

    Insert Membership    ${data}
    
    SignIn admin
    Go to memberships
    Request removal    ${data}[account][name]
    Confirm removal
    Membership should not be visible    ${data}[account][name]





    
