require 'test_helper'

class PlataformasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plataforma = plataformas(:one)
  end

  test "should get index" do
    get plataformas_url
    assert_response :success
  end

  test "should get new" do
    get new_plataforma_url
    assert_response :success
  end

  test "should create plataforma" do
    assert_difference('Plataforma.count') do
      post plataformas_url, params: { plataforma: { cnpj: @plataforma.cnpj, descricao: @plataforma.descricao, desenvolvedora: @plataforma.desenvolvedora } }
    end

    assert_redirected_to plataforma_url(Plataforma.last)
  end

  test "should show plataforma" do
    get plataforma_url(@plataforma)
    assert_response :success
  end

  test "should get edit" do
    get edit_plataforma_url(@plataforma)
    assert_response :success
  end

  test "should update plataforma" do
    patch plataforma_url(@plataforma), params: { plataforma: { cnpj: @plataforma.cnpj, descricao: @plataforma.descricao, desenvolvedora: @plataforma.desenvolvedora } }
    assert_redirected_to plataforma_url(@plataforma)
  end

  test "should destroy plataforma" do
    assert_difference('Plataforma.count', -1) do
      delete plataforma_url(@plataforma)
    end

    assert_redirected_to plataformas_url
  end
end
