require 'test_helper'

class ProdutoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get produto_index_url
    assert_response :success
  end

  test "should get new" do
    get produto_new_url
    assert_response :success
  end

  test "should get show" do
    get produto_show_url
    assert_response :success
  end

  test "should get create" do
    get produto_create_url
    assert_response :success
  end

  test "should get edit" do
    get produto_edit_url
    assert_response :success
  end

  test "should get update" do
    get produto_update_url
    assert_response :success
  end

  test "should get destroy" do
    get produto_destroy_url
    assert_response :success
  end

end
