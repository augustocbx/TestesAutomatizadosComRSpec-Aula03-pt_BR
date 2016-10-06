# language: en
#
# Created by augustocbx on 10/5/16. ***
#
Feature: Criar Classe

  Background:
    Given Eu esteja na tela de listagem das classes

  Scenario: Eu sou um usuário com permissão no sistema e quero inserir uma nova Classe válida
    Given Tesdfadfa
    When Eu clico no botão "Nova classe"
    And preencho o campo "classe[nome]" com "Teste"
    And Eu clico no botão "Cadastrar"
    Then Eu quero ver o nome "Teste" na tela
    And A mensagem "Assunto criado com sucesso"
    
#  Scenario: Eu sou um usuário com permissão no sistema e quero inserir um novo assunto sem nome
#    When Eu clico no botão "Novo assunto"
#    And preencho o campo "assunto[nome]" com ""
#    And Eu clico no botão "Cadastrar"
#    Then Eu quero ver mensagem "Assunto não criado"
#    And Eu quero ver mensagem "Nome é obrigatório"