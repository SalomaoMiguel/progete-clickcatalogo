require 'test_helper'

class Lojista::PlanoControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get lojista_plano_edit_url
    assert_response :success
  end

  test "should get index" do
    get lojista_plano_index_url
    assert_response :success
  end

end
