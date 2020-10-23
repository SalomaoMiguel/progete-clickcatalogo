require 'test_helper'

class Admin::PanelControllerTest < ActionDispatch::IntegrationTest
  test "should get visao_geral" do
    get admin_panel_visao_geral_url
    assert_response :success
  end

end
