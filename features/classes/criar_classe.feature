# language: en
#
# Created by augustocbx on 10/5/16. ***
#
Feature: Criar Classe

  Background:
    Given Eu esteja na tela de listagem das classes
    When Eu clico no botão "Nova classe"

  Scenario Outline: Eu sou um usuário com permissão no sistema e quero inserir uma nova Classe válida
    When preencho o campo "classe[nome]" com "<nome>"
    And Eu clico no botão "Cadastrar"
    Then Eu quero ver o nome "<nome>" na tela
    And A mensagem "<mensagem>"
  Examples:
  |nome|mensagem|
  |Nova|Classe criada com sucesso|
  |Nova 2|Classe criada com sucesso|
  |Nova 3|Classe criada com sucesso|
  |Nova 4|Classe criada com sucesso|
  ||Classe não criada|
    
#  Scenario: Eu sou um usuário com permissão no sistema e quero inserir um novo assunto sem nome
#    When preencho o campo "classe[nome]" com ""
#    And Eu clico no botão "Cadastrar"
#    Then Eu quero ver mensagem "Classe não criada"
#    And Eu quero ver mensagem "Nome é obrigatório"