require 'test_helper'

class Admin::SettingPerfilControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_setting_perfil_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_setting_perfil_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_setting_perfil_update_url
    assert_response :success
  end

end
