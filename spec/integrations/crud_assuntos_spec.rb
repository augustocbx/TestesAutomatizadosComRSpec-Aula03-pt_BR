require 'rails_helper'

feature 'Crud Assuntos' do
  scenario 'Criação de assunto' do
    visit assuntos_path
    click_on 'Novo assunto'
    fill_in 'assunto[nome]', with: 'lalalá'
    click_on 'Cadastrar'
    expect(page).to have_content('Assunto criado com sucesso.')
    expect(page).to have_content('lalalá')
  end
  scenario 'Alteração de assunto' do
    create_list(:assunto, 5)
    visit assuntos_path
    click_on 'Editar Assunto', match: :first
    fill_in 'assunto[nome]', with: 'lalalá edit'
    click_on 'Alterar'
    expect(page).to have_content('Assunto alterado com sucesso.')
    expect(page).to have_content('lalalá edit')
  end
  scenario 'Remoção de um assunto' do
    create_list(:assunto, 5)
    visit assuntos_path
    expect(all('tr.assunto_linha').size).to eq(5)
    click_on 'Remover Assunto', match: :first
    expect(page).to have_content('Assunto removido com sucesso')
    expect(all('tr.assunto_linha').size).to eq(4)
  end
end