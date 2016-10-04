require 'rails_helper'

describe 'autos/show', type: :view do
  it 'Quero ver os dados na tela' do
    auto = create(:auto)
    assign(:auto, auto)

    render

    expect(rendered).to match(auto.observacao)
    expect(rendered).to match(auto.classe.nome)
    expect(rendered).to match(auto.assunto.nome)
    assert_select("a[href=?]", edit_auto_path(auto))
  end
end