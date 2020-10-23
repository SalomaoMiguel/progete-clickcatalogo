require 'test_helper'

class Lojista::PlanoPagamentosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lojista_plano_pagamentos_index_url
    assert_response :success
  end

  test "should get new" do
    get lojista_plano_pagamentos_new_url
    assert_response :success
  end

  test "should get edit" do
    get lojista_plano_pagamentos_edit_url
    assert_response :success
  end

  test "should get create" do
    get lojista_plano_pagamentos_create_url
    assert_response :success
  end

  test "should get update" do
    get lojista_plano_pagamentos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get lojista_plano_pagamentos_destroy_url
    assert_response :success
  end

end
