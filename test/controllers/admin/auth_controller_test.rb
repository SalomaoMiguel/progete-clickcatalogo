require 'test_helper'

class Admin::AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get autenticar" do
    get admin_auth_autenticar_url
    assert_response :success
  end

  test "should get sair" do
    get admin_auth_sair_url
    assert_response :success
  end

end
