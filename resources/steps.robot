*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
### Hooks
Abrir navegador
    Open Browser                http://localhost:8080/php-pdo-oop-clean-urls-postgresql/clientes/novo/       chrome
    Set Selenium Implicit Wait  10
Fechar navegador
    Close Browser

### Steps
Dado que "${nome}" e o meu nome
    Set Global Variable     ${nome}

Quando eu entro com este nome
    Input Text                  id:inputNome        ${nome}

Dado que "${email}" e o email
    Set Global Variable     ${email}

Quando eu entro com este email
    Input Text                  id:inputEmail       ${email}

Dado que "${cpf}" e o cpf
    Set Global Variable     ${cpf}

Quando eu entro com este cpf
    Input Text                  id:inputCpf        ${cpf}

Dado que "${data_de_nascimento}" e a data_de_nascimento
    Set Global Variable     ${data_de_nascimento}

Quando eu entro com esta data_de_nascimento
    Input Text                  id:inputDataDeNascimento        ${data_de_nascimento}

Dado que "${sexo}" e o sexo
    Set Global Variable     ${sexo}

Quando eu entro com este sexo
    Page Should Contain Element    xpath=//*[@id="inputSexo"]    5s
    Select From List by Value    inputSexo    ${sexo}

Dado que "${estado_civil}" e o estado_civil
    Set Global Variable     ${estado_civil}

Quando eu entro com este estado_civil
    Page Should Contain Element    xpath=//*[@id="inputEstadoCivil"]    5s
    Select From List by Value    inputEstadoCivil    ${estado_civil}
Entao devo ver o cliente cadastrado
    Click Element               css:button[type=submit]
    Page Should Contain Element     class:form-row