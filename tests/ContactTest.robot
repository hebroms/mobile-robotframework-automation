*** Settings ***
Resource        ../resources/base.resource
Suite Setup     Open App
Suite Teardown  Close All Applications

*** Test Cases ***
Cenário: Criar novo Contato
    [Documentation]    Cenário basico de criação de contato
    [Tags]      smoketest
    Click In Create Contact
    Fill out the entire form
    Click in Save Create Contact
    Validate view Contact

Cenário: Visualizar contato
    [Documentation]    Cenário basico de visualização de contato
    [Tags]      smoketest
    Click in Contact
    Validate view Contact
    
Cenário: Editar contato
    [Documentation]    Cenário basico de edição de contato
    [Tags]      smoketest
    Click in Contact
    Click in edit contact
    Change information
    Click in Save Edit Contact
    Validate view Contact