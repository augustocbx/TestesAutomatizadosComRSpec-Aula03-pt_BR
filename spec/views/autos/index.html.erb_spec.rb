require 'rails_helper'

describe 'autos/index', type: :view do
  it 'Não existem autos cadastrados' do
    assign(:autos, [])

    render

    expect(rendered).to match(/Não existem autos cadastrados/)
  end

  it 'Existem autos cadastrados' do
    autos = create_list(:auto, 2)
    assign(:autos, autos)

    render

    expect(rendered).to match(autos.first.observacao)
    expect(rendered).to match(autos.last.observacao)
  end
end