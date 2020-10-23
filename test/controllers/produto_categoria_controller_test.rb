require 'test_helper'

class ProdutoCategoriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produto_categorium = produto_categoria(:one)
  end

  test "should get index" do
    get produto_categoria_url
    assert_response :success
  end

  test "should get new" do
    get new_produto_categorium_url
    assert_response :success
  end

  test "should create produto_categorium" do
    assert_difference('ProdutoCategorium.count') do
      post produto_categoria_url, params: { produto_categorium: { descricao: @produto_categorium.descricao, disponivel: @produto_categorium.disponivel, empresa_id: @produto_categorium.empresa_id } }
    end

    assert_redirected_to produto_categorium_url(ProdutoCategorium.last)
  end

  test "should show produto_categorium" do
    get produto_categorium_url(@produto_categorium)
    assert_response :success
  end

  test "should get edit" do
    get edit_produto_categorium_url(@produto_categorium)
    assert_response :success
  end

  test "should update produto_categorium" do
    patch produto_categorium_url(@produto_categorium), params: { produto_categorium: { descricao: @produto_categorium.descricao, disponivel: @produto_categorium.disponivel, empresa_id: @produto_categorium.empresa_id } }
    assert_redirected_to produto_categorium_url(@produto_categorium)
  end

  test "should destroy produto_categorium" do
    assert_difference('ProdutoCategorium.count', -1) do
      delete produto_categorium_url(@produto_categorium)
    end

    assert_redirected_to produto_categoria_url
  end
end
