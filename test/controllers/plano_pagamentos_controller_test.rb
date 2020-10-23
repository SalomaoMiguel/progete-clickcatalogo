require 'test_helper'

class PlanoPagamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plano_pagamento = plano_pagamentos(:one)
  end

  test "should get index" do
    get plano_pagamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_plano_pagamento_url
    assert_response :success
  end

  test "should create plano_pagamento" do
    assert_difference('PlanoPagamento.count') do
      post plano_pagamentos_url, params: { plano_pagamento: { descricao: @plano_pagamento.descricao, disponivel: @plano_pagamento.disponivel, empresa_id: @plano_pagamento.empresa_id, troco_ativo: @plano_pagamento.troco_ativo } }
    end

    assert_redirected_to plano_pagamento_url(PlanoPagamento.last)
  end

  test "should show plano_pagamento" do
    get plano_pagamento_url(@plano_pagamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_plano_pagamento_url(@plano_pagamento)
    assert_response :success
  end

  test "should update plano_pagamento" do
    patch plano_pagamento_url(@plano_pagamento), params: { plano_pagamento: { descricao: @plano_pagamento.descricao, disponivel: @plano_pagamento.disponivel, empresa_id: @plano_pagamento.empresa_id, troco_ativo: @plano_pagamento.troco_ativo } }
    assert_redirected_to plano_pagamento_url(@plano_pagamento)
  end

  test "should destroy plano_pagamento" do
    assert_difference('PlanoPagamento.count', -1) do
      delete plano_pagamento_url(@plano_pagamento)
    end

    assert_redirected_to plano_pagamentos_url
  end
end
