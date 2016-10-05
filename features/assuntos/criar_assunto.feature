#
# Created by augustocbx on 10/5/16. ***
#
Feature: Alterar assuntos

  Scenario: Eu sou um usuário com permissão no sistema e quero inserir um novo assunto válido
    Given Eu esteja na tela de listagem dos assuntos
    When Eu clico no botão "Novo assunto"
    And preencho o campo "assunto[nome]" com "Férias"
    And Eu clico no botão "Cadastrar"
    Then Eu quero ver o nome "Férias" na tela
    And A mensagem "Assunto criado com sucesso"
    
  Scenario: Eu sou um usuário com permissão no sistema e quero inserir um novo assunto sem nome
    Given Eu esteja na tela de listagem dos assuntos
    When Eu clico no botão "Novo assunto"
    And preencho o campo "assunto[nome]" com ""
    And Eu clico no botão "Cadastrar"
    Then Eu quero ver mensagem "Assunto não criado"
    And Eu quero ver mensagem "Nome é obrigatório"