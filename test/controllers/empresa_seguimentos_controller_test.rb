require 'test_helper'

class EmpresaSeguimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empresa_seguimento = empresa_seguimentos(:one)
  end

  test "should get index" do
    get empresa_seguimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_empresa_seguimento_url
    assert_response :success
  end

  test "should create empresa_seguimento" do
    assert_difference('EmpresaSeguimento.count') do
      post empresa_seguimentos_url, params: { empresa_seguimento: { ativo: @empresa_seguimento.ativo, descricao: @empresa_seguimento.descricao } }
    end

    assert_redirected_to empresa_seguimento_url(EmpresaSeguimento.last)
  end

  test "should show empresa_seguimento" do
    get empresa_seguimento_url(@empresa_seguimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_empresa_seguimento_url(@empresa_seguimento)
    assert_response :success
  end

  test "should update empresa_seguimento" do
    patch empresa_seguimento_url(@empresa_seguimento), params: { empresa_seguimento: { ativo: @empresa_seguimento.ativo, descricao: @empresa_seguimento.descricao } }
    assert_redirected_to empresa_seguimento_url(@empresa_seguimento)
  end

  test "should destroy empresa_seguimento" do
    assert_difference('EmpresaSeguimento.count', -1) do
      delete empresa_seguimento_url(@empresa_seguimento)
    end

    assert_redirected_to empresa_seguimentos_url
  end
end
