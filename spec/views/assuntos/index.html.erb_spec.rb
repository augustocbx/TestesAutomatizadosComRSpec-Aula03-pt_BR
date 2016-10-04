require 'rails_helper'

describe 'assuntos/index', type: :view do
  it 'Não existem assuntos cadastrados' do
    assign(:assuntos, [])

    render

    expect(rendered).to match(/Não existem assuntos cadastrados/)
  end

  it 'Existem assuntos cadastrados' do
    assuntos = create_list(:assunto, 2)
    assign(:assuntos, assuntos)

    render

    expect(rendered).to match(assuntos.first.nome)
    expect(rendered).to match(assuntos.last.nome)
  end
end