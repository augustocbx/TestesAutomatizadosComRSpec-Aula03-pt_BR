require 'rails_helper'

describe 'assuntos/show', type: :view do
  it 'Quero ver os dados na tela' do
    assunto = create(:assunto)
    assign(:assunto, assunto)

    render

    expect(rendered).to match(assunto.nome)
    assert_select("a[href=?]", "/assuntos/#{assunto.id}/edit")
  end
end