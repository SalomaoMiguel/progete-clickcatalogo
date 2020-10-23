require 'test_helper'

class Lojista::EditEmpresasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lojista_edit_empresas_index_url
    assert_response :success
  end

  test "should get new" do
    get lojista_edit_empresas_new_url
    assert_response :success
  end

  test "should get create" do
    get lojista_edit_empresas_create_url
    assert_response :success
  end

  test "should get edit" do
    get lojista_edit_empresas_edit_url
    assert_response :success
  end

  test "should get update" do
    get lojista_edit_empresas_update_url
    assert_response :success
  end

  test "should get show" do
    get lojista_edit_empresas_show_url
    assert_response :success
  end

  test "should get destroy" do
    get lojista_edit_empresas_destroy_url
    assert_response :success
  end

end
