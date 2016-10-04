require 'rails_helper'

describe 'assuntos/new', type: :view do
  it 'Quero ver um formulário vazio' do
    assign(:assunto, Assunto.new)

    render

    assert_select("form[action=?]", '/assuntos')
    assert_select("input[name=?]", 'assunto[nome]')
    assert_select("input[type=?]", 'submit')

  end
end