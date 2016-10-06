# language: pt
#
# Created by augustocbx on 10/5/16. ***
#
Funcionalidade: : Alterar assuntos

  Cenário: Eu sou um usuário com permissão no sistema e quero alterar um assunto
    Dado já existam assuntos cadastrados
    E Eu esteja na tela de listagem dos assuntos
    Quando Eu clico no botão "Editar Assunto"
    E preencho o campo "assunto[nome]" com "Tralalá"
    E Eu clico no botão "Alterar"
    Então  Eu quero ver o nome "Tralalá" na tela
    E A mensagem "Assunto alterado com sucesso"

  Cenário: Eu sou um usuário com permissão no sistema e quero alterar um assunto com dados inválidos
    Dado já existam assuntos cadastrados
    E Eu esteja na tela de listagem dos assuntos
    Quando Eu clico no botão "Editar Assunto"
    E preencho o campo "assunto[nome]" com ""
    E Eu clico no botão "Alterar"
    Então Eu quero ver mensagem "Assunto não alterado"
    E Eu quero ver mensagem "Nome é obrigatório"