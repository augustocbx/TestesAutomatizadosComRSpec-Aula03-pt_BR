require 'rails_helper'

feature 'Crud Assuntos' do
  scenario 'Criação de assunto' do
    visit assuntos_path
    click_on 'Novo assunto'
    sleep 5
    fill_in 'assunto[nome]', with: 'lalalá'
    click_on 'Cadastrar'
    expect(page).to have_content('Assunto criado com sucesso.')
    expect(page).to have_content('lalalá')
  end
  # scenario 'Alteração de assunto' do
  #   create_list(:assunto, 5)
  #   visit assuntos_path
  #   click_on 'Editar Assunto'
  #   fill_in 'assunto[nome]', 'lalalá'
  #   click_on 'Alterar'
  #   expect(page).to have_content('assunto alterado com sucesso')
  #   expect(page).to have_content('lalalá')
  # end
  # scenario 'Remoção de um assunto' do
  #   create_list(:assunto, 5)
  #   click_on 'Remover Assunto'
  #   expect(page).to have_content('assunto removido com sucesso')
  #   expect(assigns(:assuntos).size).to eq(4)
  # end
end