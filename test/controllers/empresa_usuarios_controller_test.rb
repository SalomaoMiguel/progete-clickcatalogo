require 'test_helper'

class EmpresaUsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empresa_usuario = empresa_usuarios(:one)
  end

  test "should get index" do
    get empresa_usuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_empresa_usuario_url
    assert_response :success
  end

  test "should create empresa_usuario" do
    assert_difference('EmpresaUsuario.count') do
      post empresa_usuarios_url, params: { empresa_usuario: { email: @empresa_usuario.email, email_validado: @empresa_usuario.email_validado, empresa_id: @empresa_usuario.empresa_id, nome: @empresa_usuario.nome, senha: @empresa_usuario.senha, telefone: @empresa_usuario.telefone } }
    end

    assert_redirected_to empresa_usuario_url(EmpresaUsuario.last)
  end

  test "should show empresa_usuario" do
    get empresa_usuario_url(@empresa_usuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_empresa_usuario_url(@empresa_usuario)
    assert_response :success
  end

  test "should update empresa_usuario" do
    patch empresa_usuario_url(@empresa_usuario), params: { empresa_usuario: { email: @empresa_usuario.email, email_validado: @empresa_usuario.email_validado, empresa_id: @empresa_usuario.empresa_id, nome: @empresa_usuario.nome, senha: @empresa_usuario.senha, telefone: @empresa_usuario.telefone } }
    assert_redirected_to empresa_usuario_url(@empresa_usuario)
  end

  test "should destroy empresa_usuario" do
    assert_difference('EmpresaUsuario.count', -1) do
      delete empresa_usuario_url(@empresa_usuario)
    end

    assert_redirected_to empresa_usuarios_url
  end
end
