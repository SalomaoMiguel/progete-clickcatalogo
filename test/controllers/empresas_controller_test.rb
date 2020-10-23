require 'test_helper'

class EmpresasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empresa = empresas(:one)
  end

  test "should get index" do
    get empresas_url
    assert_response :success
  end

  test "should get new" do
    get new_empresa_url
    assert_response :success
  end

  test "should create empresa" do
    assert_difference('Empresa.count') do
      post empresas_url, params: { empresa: { celular: @empresa.celular, cidade: @empresa.cidade, cnpj_cpf: @empresa.cnpj_cpf, cor_layout: @empresa.cor_layout, email: @empresa.email, empresa_seguimento_id: @empresa.empresa_seguimento_id, endereco: @empresa.endereco, fb_url: @empresa.fb_url, insta_url: @empresa.insta_url, logomarca: @empresa.logomarca, loja_id: @empresa.loja_id, pint_url: @empresa.pint_url, plano_id: @empresa.plano_id, razao: @empresa.razao, sobre: @empresa.sobre, telefone: @empresa.telefone, web_site: @empresa.web_site } }
    end

    assert_redirected_to empresa_url(Empresa.last)
  end

  test "should show empresa" do
    get empresa_url(@empresa)
    assert_response :success
  end

  test "should get edit" do
    get edit_empresa_url(@empresa)
    assert_response :success
  end

  test "should update empresa" do
    patch empresa_url(@empresa), params: { empresa: { celular: @empresa.celular, cidade: @empresa.cidade, cnpj_cpf: @empresa.cnpj_cpf, cor_layout: @empresa.cor_layout, email: @empresa.email, empresa_seguimento_id: @empresa.empresa_seguimento_id, endereco: @empresa.endereco, fb_url: @empresa.fb_url, insta_url: @empresa.insta_url, logomarca: @empresa.logomarca, loja_id: @empresa.loja_id, pint_url: @empresa.pint_url, plano_id: @empresa.plano_id, razao: @empresa.razao, sobre: @empresa.sobre, telefone: @empresa.telefone, web_site: @empresa.web_site } }
    assert_redirected_to empresa_url(@empresa)
  end

  test "should destroy empresa" do
    assert_difference('Empresa.count', -1) do
      delete empresa_url(@empresa)
    end

    assert_redirected_to empresas_url
  end
end
