require 'test_helper'

class Lojista::ProdutoCategoriasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lojista_produto_categorias_index_url
    assert_response :success
  end

  test "should get show" do
    get lojista_produto_categorias_show_url
    assert_response :success
  end

  test "should get edit" do
    get lojista_produto_categorias_edit_url
    assert_response :success
  end

  test "should get new" do
    get lojista_produto_categorias_new_url
    assert_response :success
  end

  test "should get create" do
    get lojista_produto_categorias_create_url
    assert_response :success
  end

  test "should get update" do
    get lojista_produto_categorias_update_url
    assert_response :success
  end

  test "should get destroy" do
    get lojista_produto_categorias_destroy_url
    assert_response :success
  end

end
