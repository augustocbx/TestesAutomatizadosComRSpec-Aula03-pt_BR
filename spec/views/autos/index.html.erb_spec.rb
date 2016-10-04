require 'rails_helper'

describe 'autos/index', type: :view do
  it 'Não existem autos cadastrados' do
    assign(:autos, [])

    render

    expect(rendered).to match(/Não existem autos cadastrados/)
  end

  it 'Existem autos cadastrados' do
    autos = create_list(:auto, 5)
    assign(:autos, autos)

    render

    autos.each do |auto|
      expect(rendered).to match(auto.classe.nome)
      expect(rendered).to match(auto.assunto.nome)
      expect(rendered).to match(auto.observacao)
    end
  end
end