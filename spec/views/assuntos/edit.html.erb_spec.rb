require 'rails_helper'

describe 'assuntos/edit', type: :view do
  it 'Quero ver um formulário preenchido' do
    assunto = create(:assunto)
    assign(:assunto, assunto)

    render

    assert_select("form[action=?]", "/assuntos/#{assunto.id}")
    assert_select("input[name=?][value=?]",     'assunto[nome]', assunto.nome)
    assert_select("input[type=?][value=?]", 'submit', 'Alterar')
  end
end