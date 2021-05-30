*** Settings ***
Documentation   Cadastro de Usuário
...     Para que eu possa ter acesso a interface de administração de spots
...     Sendo um usuario que possui um email
...     Quero poder iniciar uma nova sessao
Resource        ../../resources/steps.robot

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***
Telefone não informado
    Dado que estou logado
    Dado que o cliente está cadastrado
    Clico em Adicionar telefone
    Dado que a descrição é "Celular"
    Quando entro com esta descrição
    Dado que o telefone é "${EMPTY}"
    Quando entro com esse telefone
    Entao devo ver o alerta

Novo telefone
    Dado que estou logado
    Dado que o cliente está cadastrado
    Clico em Adicionar telefone
    Dado que a descrição é "Celular"
    Quando entro com esta descrição
    Dado que o telefone é "11999999999"
    Quando entro com esse telefone
    Clico em Cadastrar
    Então devo vê o telefone cadastrado