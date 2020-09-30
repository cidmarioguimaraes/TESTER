# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

require_relative 'helpers'

# Aqui diz que o modulo Helpers é nativo para a execução do cucumber,
# assim posso executar em qualquer lugar no projeto
#World(Helpers)

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = 'https://dev.lokus.com.br/'
  config.default_max_wait_time = 10
end
