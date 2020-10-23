require "application_system_test_case"

class PlanoPagamentosTest < ApplicationSystemTestCase
  setup do
    @plano_pagamento = plano_pagamentos(:one)
  end

  test "visiting the index" do
    visit plano_pagamentos_url
    assert_selector "h1", text: "Plano Pagamentos"
  end

  test "creating a Plano pagamento" do
    visit plano_pagamentos_url
    click_on "New Plano Pagamento"

    fill_in "Descricao", with: @plano_pagamento.descricao
    check "Disponivel" if @plano_pagamento.disponivel
    fill_in "Empresa", with: @plano_pagamento.empresa_id
    check "Troco ativo" if @plano_pagamento.troco_ativo
    click_on "Create Plano pagamento"

    assert_text "Plano pagamento was successfully created"
    click_on "Back"
  end

  test "updating a Plano pagamento" do
    visit plano_pagamentos_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @plano_pagamento.descricao
    check "Disponivel" if @plano_pagamento.disponivel
    fill_in "Empresa", with: @plano_pagamento.empresa_id
    check "Troco ativo" if @plano_pagamento.troco_ativo
    click_on "Update Plano pagamento"

    assert_text "Plano pagamento was successfully updated"
    click_on "Back"
  end

  test "destroying a Plano pagamento" do
    visit plano_pagamentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plano pagamento was successfully destroyed"
  end
end
