*** Settings ***
Documentation   Cadastro de Usuário
...     Para que eu possa ter acesso a interface de administração de spots
...     Sendo um usuario que possui um email
...     Quero poder iniciar uma nova sessao
Resource        ../resources/steps.robot

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***
Nome não informado
    Dado que "${EMPTY}" e o meu nome
    Quando eu entro com este nome
    Dado que "contato@douglascarlos.dev" e o email
    Quando eu entro com este email
    Dado que "11122233344" e o cpf
    Quando eu entro com este cpf
    Dado que "15/01/2000" e a data_de_nascimento
    Quando eu entro com esta data_de_nascimento
    Dado que "Feminino" e o sexo
    Quando eu entro com este sexo
    Dado que "Casado" e o estado_civil
    Quando eu entro com este estado_civil
    Entao devo ver o alerta

Email não informado
    Dado que "Fulana da Silva" e o meu nome
    Quando eu entro com este nome
    Dado que "${EMPTY}" e o email
    Quando eu entro com este email
    Dado que "11122233344" e o cpf
    Quando eu entro com este cpf
    Dado que "15/01/2000" e a data_de_nascimento
    Quando eu entro com esta data_de_nascimento
    Dado que "Feminino" e o sexo
    Quando eu entro com este sexo
    Dado que "Casado" e o estado_civil
    Quando eu entro com este estado_civil
    Entao devo ver o alerta

CPF não informado
    Dado que "Fulana da Silva" e o meu nome
    Quando eu entro com este nome
    Dado que "contato@douglascarlos.dev" e o email
    Quando eu entro com este email
    Dado que "${EMPTY}" e o cpf
    Quando eu entro com este cpf
    Dado que "15/01/2000" e a data_de_nascimento
    Quando eu entro com esta data_de_nascimento
    Dado que "Feminino" e o sexo
    Quando eu entro com este sexo
    Dado que "Casado" e o estado_civil
    Quando eu entro com este estado_civil
    Entao devo ver o alerta

Data De Nascimento não informado
    Dado que "Fulana da Silva" e o meu nome
    Quando eu entro com este nome
    Dado que "contato@douglascarlos.dev" e o email
    Quando eu entro com este email
    Dado que "11122233344" e o cpf
    Quando eu entro com este cpf
    Dado que "${EMPTY}" e a data_de_nascimento
    Quando eu entro com esta data_de_nascimento
    Dado que "Feminino" e o sexo
    Quando eu entro com este sexo
    Dado que "Casado" e o estado_civil
    Quando eu entro com este estado_civil
    Entao devo ver o alerta

Novo usuário
    Dado que "Fulana da Silva" e o meu nome
    Quando eu entro com este nome
    Dado que "contato@douglascarlos.dev" e o email
    Quando eu entro com este email
    Dado que "11122233344" e o cpf
    Quando eu entro com este cpf
    Dado que "15/01/2000" e a data_de_nascimento
    Quando eu entro com esta data_de_nascimento
    Dado que "Feminino" e o sexo
    Quando eu entro com este sexo
    Dado que "Casado" e o estado_civil
    Quando eu entro com este estado_civil
    Entao devo ver o cliente cadastrado