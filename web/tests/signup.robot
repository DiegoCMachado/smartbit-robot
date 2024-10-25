*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource        ../resources/Base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente
    [Tags]    smoke
    
    ${account}    Create Dictionary
    ...    name=Machado Diego
    ...    email=diego.machado@gmail.com
    ...    cpf=06097411871   

    Delete Account By Email    ${account}[email]     
    
       
    Submit signup form        ${account}
    Verify welcome message
    Take Screenshot
    
Tentativa de pré cadastro
    [Template]        Attempt signup
    ${EMPTY}         machado.dc@gmail.com    12456754000    Por favor informe o seu nome completo
    Diego machado    ${EMPTY}                12456754000    Por favor, informe o seu melhor e-mail
    Diego Machado    machado.dc@gmail.com    ${EMPTY}       Por favor, informe o seu CPF
    Diego Machado    machado&gmail.com       12456754000    Oops! O email informado é inválido
    Diego Machado    machado*&*gmail.com     12456754000    Oops! O email informado é inválido
    Diego Machado    www.google.com          12456754000    Oops! O email informado é inválido
    Diego Machado    HHJHUYR%&¨%%¨#¨%$       12456754000    Oops! O email informado é inválido
    Diego Machado    24324545456677865       12456754000    Oops! O email informado é inválido
    Diego machado    machado.dc@gmail.com    1245675400A    Oops! O CPF informado é inválido
    Diego machado    machado.dc@gmail.com    12456754009    Oops! O CPF informado é inválido
    Diego machado    machado.dc@gmail.com    12456754       Oops! O CPF informado é inválido
    Diego machado    machado.dc@gmail.com    abdhdur        Oops! O CPF informado é inválido
    Diego machado    machado.dc@gmail.com    %&¨$&%#*&%     Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}        Create Dictionary
     ...    name=${name}
     ...    email=${email}
     ...    cpf=${cpf}
    
    Submit signup form        ${account}    
    Notice should be          ${output_message}
      




