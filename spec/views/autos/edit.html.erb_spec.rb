require 'rails_helper'

describe 'autos/edit', type: :view do
  it 'Quero ver um formulário preenchido' do
    auto = create(:auto)
    assign(:auto, auto)
    assign(:assuntos, create_list(:assunto, 3))
    assign(:classes, create_list(:classe, 3))

    render

    assert_select("form[action=?]", "/autos/#{auto.id}")
    assert_select("select[name=?]", 'auto[assunto_id]')
    assert_select("select[name=?]", 'auto[classe_id]')
    assert_select("textarea[name=?]", 'auto[observacao]')
    assert_select("input[type=?]", 'submit')
  end
end