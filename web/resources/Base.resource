*** Settings ***

Documentation        Arquivo principal do projeto Robot

Variables      Env.py

Library        Browser
Library        ../../libs/Account.py
Library        ../../libs/Database.py
Library    JSONLibrary

Resource        pages/Landing.resource
Resource        pages/Welcome.resource
Resource        pages/Login.resource
Resource        pages/Accounts.resource
Resource        pages/Memberships.resource
Resource        pages/components/Toast.resource
Resource        pages/components/BoxNotice.resource
Resource        pages/components/Navbar.resource
Resource        pages/components/Modal.resource

*** Variables ***
${ADMIN_EMAIL}        sac@smartbit.com
${ADMIN_PASSWORD}     pwd123


*** Keywords **
Start Session
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    ${BASE_URL}

#Helpers
Get Json fixture
    [Arguments]    ${file_name}    ${scenario}

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/${file_name}.Json

    RETURN    ${data}[${scenario}]    

SignIn admin
    [Arguments]
    Go to login page
    Submit login form    ${ADMIN_EMAIL}   ${ADMIN_PASSWORD}
    User is logged in    ${ADMIN_EMAIL}

    