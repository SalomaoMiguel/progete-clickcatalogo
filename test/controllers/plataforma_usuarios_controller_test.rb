require 'test_helper'

class PlataformaUsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plataforma_usuario = plataforma_usuarios(:one)
  end

  test "should get index" do
    get plataforma_usuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_plataforma_usuario_url
    assert_response :success
  end

  test "should create plataforma_usuario" do
    assert_difference('PlataformaUsuario.count') do
      post plataforma_usuarios_url, params: { plataforma_usuario: { ativo: @plataforma_usuario.ativo, email: @plataforma_usuario.email, nome: @plataforma_usuario.nome, plataforma_id_id: @plataforma_usuario.plataforma_id_id, senha: @plataforma_usuario.senha } }
    end

    assert_redirected_to plataforma_usuario_url(PlataformaUsuario.last)
  end

  test "should show plataforma_usuario" do
    get plataforma_usuario_url(@plataforma_usuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_plataforma_usuario_url(@plataforma_usuario)
    assert_response :success
  end

  test "should update plataforma_usuario" do
    patch plataforma_usuario_url(@plataforma_usuario), params: { plataforma_usuario: { ativo: @plataforma_usuario.ativo, email: @plataforma_usuario.email, nome: @plataforma_usuario.nome, plataforma_id_id: @plataforma_usuario.plataforma_id_id, senha: @plataforma_usuario.senha } }
    assert_redirected_to plataforma_usuario_url(@plataforma_usuario)
  end

  test "should destroy plataforma_usuario" do
    assert_difference('PlataformaUsuario.count', -1) do
      delete plataforma_usuario_url(@plataforma_usuario)
    end

    assert_redirected_to plataforma_usuarios_url
  end
end
