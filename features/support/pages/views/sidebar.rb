# frozen_string_literal: true

class SideBarView
  # para usar o recurso do capybara dentro da pagina
  include Capybara::DSL

  def logged_user
    find('.s-profile').text
  end
end
