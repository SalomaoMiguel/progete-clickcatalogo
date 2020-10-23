require "application_system_test_case"

class EmpresaSeguimentosTest < ApplicationSystemTestCase
  setup do
    @empresa_seguimento = empresa_seguimentos(:one)
  end

  test "visiting the index" do
    visit empresa_seguimentos_url
    assert_selector "h1", text: "Empresa Seguimentos"
  end

  test "creating a Empresa seguimento" do
    visit empresa_seguimentos_url
    click_on "New Empresa Seguimento"

    check "Ativo" if @empresa_seguimento.ativo
    fill_in "Descricao", with: @empresa_seguimento.descricao
    click_on "Create Empresa seguimento"

    assert_text "Empresa seguimento was successfully created"
    click_on "Back"
  end

  test "updating a Empresa seguimento" do
    visit empresa_seguimentos_url
    click_on "Edit", match: :first

    check "Ativo" if @empresa_seguimento.ativo
    fill_in "Descricao", with: @empresa_seguimento.descricao
    click_on "Update Empresa seguimento"

    assert_text "Empresa seguimento was successfully updated"
    click_on "Back"
  end

  test "destroying a Empresa seguimento" do
    visit empresa_seguimentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empresa seguimento was successfully destroyed"
  end
end
