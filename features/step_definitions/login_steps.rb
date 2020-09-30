# frozen_string_literal: true

Dado('que estou na tela de login') do
  visit '/login'
end

Quando(/^eu informo (.*),  (.*) e (.*) e clico em "([^"]*)"$/) do |cpf, organizacao, senha, entrar|
  @login_page.go
  @login_page.with(cpf, organizacao, senha, entrar)
  sleep 3
end

Então('devo verificar que o {string} logou com sucesso') do |usuario|
  expect(@sidebar.logged_user).to include usuario
end

E('a organização logada tem o {string}') do |conta|
  expect(@sidebar.logged_user).to include conta
end

Então('devo verificar a {string}, me impedindo de acessar o sistema') do |expect_msg|
expect(@login_page.alert).to include expect_msg
end

Quando('informo o cpf inválido {string} e teclar enter') do |cpf|
@login_page.with_invalid(cpf)
end

Então('devo verificar a mensagem {string} me impedindo de acessar o sistema') do |expect_msg|
  expect(@login_page.alert).to include expect_msg
end




