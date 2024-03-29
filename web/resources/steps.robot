*** Settings ***
Library     SeleniumLibrary
Library     DateTime 
Library     ./libs/postgresql.py

*** Keywords ***
### Hooks
Abrir navegador
    Open Browser                http://localhost:80/php-pdo-oop-clean-urls-postgresql/       chrome
    Set Selenium Implicit Wait  10
Fechar navegador
    Close Browser

### Steps Cadastro Cliente
Dado que estou logado
    Sleep   1s
    Input Text                  id:inputUsuario        admin
    Input Text                  id:inputSenha        admin
    Click Element               css:button[type=submit]

Dado que "${nome}" e o meu nome
    Limpa Banco
    Click Link                  /php-pdo-oop-clean-urls-postgresql/clientes
    Sleep   1s
    Set Selenium Implicit Wait  10
    Click Link                  /php-pdo-oop-clean-urls-postgresql/clientes/novo/
    Sleep   1s
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
    Page Should Contain Element    xpath=//*[@id="selectSexo"]    5s
    Select From List by Value    selectSexo    ${sexo}

Dado que "${estado_civil}" e o estado_civil
    Set Global Variable     ${estado_civil}

Quando eu entro com este estado_civil
    Page Should Contain Element    xpath=//*[@id="inputEstadoCivil"]    5s
    Select From List by Value    inputEstadoCivil    ${estado_civil}

Entao devo ver o cliente cadastrado
    Click Element               css:button[type=submit]
    Set Selenium Implicit Wait  10
    ${elementNome}=     Execute Javascript      return window.document.getElementById('inputNome').value
    Should Be Equal As Strings    ${elementNome}    ${nome}
    ${elementEmail}=     Execute Javascript      return window.document.getElementById('inputEmail').value
    Should Be Equal As Strings    ${elementEmail}    ${email}
    ${elementCPF}=     Execute Javascript      return window.document.getElementById('inputCPF').value
    Should Be Equal As Strings    ${elementCPF}    111.222.333-44
    ${elementDataDeNascimento}=     Execute Javascript      return window.document.getElementById('inputDataDeNascimento').value
    ${elementDataDeNascimento}=     Convert Date        ${elementDataDeNascimento}      result_format=%d/%m/%Y
    Should Be Equal As Strings    ${elementDataDeNascimento}    ${data_de_nascimento}
    ${elementSexo}=     Execute Javascript      return window.document.getElementById('selectSexo').value
    Should Be Equal As Strings    ${elementSexo}    ${sexo}
    ${elementEstadoCivil}=     Execute Javascript      return window.document.getElementById('selectEstadoCivil').value
    Should Be Equal As Strings    ${elementEstadoCivil}    ${estado_civil}

### Steps Cadastro Cliente Sem nome
Entao devo ver o alerta
    Click Element               css:button[type=submit]
    Set Selenium Implicit Wait  10
    ${elementAlerta}=     Execute Javascript      return window.document.getElementById('myDIV').className
    Should Be Equal As Strings    ${elementAlerta}    alert alert-danger

### Steps Cadastro Telefone
Dado que o cliente está cadastrado
    Limpa Telefone
    Click Link                  /php-pdo-oop-clean-urls-postgresql/clientes
    Sleep   1s
    Set Selenium Implicit Wait  10
    Click Link                  /php-pdo-oop-clean-urls-postgresql/clientes/editar/11122233344
    Set Selenium Implicit Wait  10
    Sleep   1s
Clico em Adicionar telefone
    Click Element               id:novoTelefone
Dado que a descrição é "${descricao_telefone}"
    Set Global Variable     ${descricao_telefone}
Quando entro com esta descrição
    Page Should Contain Element    xpath=//*[@id="selectTipo"]    5s
    Select From List by Value    selectTipo    ${descricao_telefone}
Dado que o telefone é "${telefone}"
    Set Global Variable     ${telefone}
Quando entro com esse telefone
    Sleep   1s
    Input Text                  id:inputTelefone       ${telefone}
Clico em Cadastrar
    Click Element               css:button[type=submit]
Então devo vê o telefone cadastrado
    Set Selenium Implicit Wait  10
    ${elementTipoTelefone}=     Execute Javascript      return window.document.getElementById('inputTipoTelefone').value
    Should Be Equal As Strings    ${elementTipoTelefone}    ${descricao_telefone}
    ${elementTelefone}=     Execute Javascript      return window.document.getElementById('inputTelefone').value
    Should Be Equal As Strings    ${elementTelefone}    (11) 9 9999-9999