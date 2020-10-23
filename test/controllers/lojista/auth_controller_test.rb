require 'test_helper'

class Lojista::AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get autenticar" do
    get lojista_auth_autenticar_url
    assert_response :success
  end

  test "should get sair" do
    get lojista_auth_sair_url
    assert_response :success
  end

end
