Given(/^Eu esteja na tela de listagem dos assuntos$/) do
  visit assuntos_path
end

When(/^Eu clico no botão "([^"]*)"$/) do |botao|
  click_on botao, match: :first
end

When(/^preencho o campo "([^"]*)" com "([^"]*)"$/) do |campo, valor|
  page.save_screenshot('/Users/augustocbx/Projects/TDD_03/tmp/assuntos.png')
  fill_in campo, with: valor
end

Then(/^Eu quero ver o nome "([^"]*)" na tela$/) do |texto|
  expect(page).to have_content(texto)
end

Then(/^A mensagem "([^"]*)"$/) do |texto|
  expect(page).to have_content(texto)
end

Then(/^Eu quero ver mensagem "([^"]*)"$/) do |texto|
  expect(page).to have_content(texto)
end

Dado(/^já existam assuntos cadastrados$/) do
  create_list(:assunto, 5)
end
