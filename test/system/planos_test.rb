require "application_system_test_case"

class PlanosTest < ApplicationSystemTestCase
  setup do
    @plano = planos(:one)
  end

  test "visiting the index" do
    visit planos_url
    assert_selector "h1", text: "Planos"
  end

  test "creating a Plano" do
    visit planos_url
    click_on "New Plano"

    check "Ativo" if @plano.ativo
    fill_in "Descricao", with: @plano.descricao
    fill_in "Plataforma", with: @plano.plataforma_id
    fill_in "Qtd produto", with: @plano.qtd_produto
    fill_in "Valor", with: @plano.valor
    click_on "Create Plano"

    assert_text "Plano was successfully created"
    click_on "Back"
  end

  test "updating a Plano" do
    visit planos_url
    click_on "Edit", match: :first

    check "Ativo" if @plano.ativo
    fill_in "Descricao", with: @plano.descricao
    fill_in "Plataforma", with: @plano.plataforma_id
    fill_in "Qtd produto", with: @plano.qtd_produto
    fill_in "Valor", with: @plano.valor
    click_on "Update Plano"

    assert_text "Plano was successfully updated"
    click_on "Back"
  end

  test "destroying a Plano" do
    visit planos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plano was successfully destroyed"
  end
end
