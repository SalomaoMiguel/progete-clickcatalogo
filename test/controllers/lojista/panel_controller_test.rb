require 'test_helper'

class Lojista::PanelControllerTest < ActionDispatch::IntegrationTest
  test "should get visao_geral" do
    get lojista_panel_visao_geral_url
    assert_response :success
  end

end
