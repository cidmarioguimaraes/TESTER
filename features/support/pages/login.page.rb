# frozen_string_literal: true

class LoginPage
  include Capybara::DSL # para usar o recurso do capybara dentro da pagina

  def go
    visit '/'
  end

  def with(cpf, organizacao, senha, entrar)
    find('input[placeholder=CPF]').set cpf
    accounts = find('#accounts')
    accounts.find('option', text: organizacao).click
    find('#password').set senha
    click_button entrar
  end

  def with_invalid(cpf)
    campo = find('input[placeholder=CPF]')
    campo.set cpf
    campo.send_keys :enter
    sleep 3
  end

  def alert
    find('#login').text
  end
end
