require 'test_helper'

class Lojista::SettingPerfilEmpresaControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get lojista_setting_perfil_empresa_update_url
    assert_response :success
  end

end
