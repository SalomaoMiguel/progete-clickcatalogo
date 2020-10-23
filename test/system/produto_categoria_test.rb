require "application_system_test_case"

class ProdutoCategoriaTest < ApplicationSystemTestCase
  setup do
      @produto_categorium = produto_categoria(:one)
  end

  test "visiting the index" do
    visit produto_categoria_url
    assert_selector "h1", text: "Produto Categoria"
  end

  test "creating a Produto categorium" do
    visit produto_categoria_url
    click_on "New Produto Categorium"

    fill_in "Descricao", with: @produto_categorium.descricao
    check "Disponivel" if @produto_categorium.disponivel
    fill_in "Empresa", with: @produto_categorium.empresa_id
    click_on "Create Produto categorium"

    assert_text "Produto categorium was successfully created"
    click_on "Back"
  end

  test "updating a Produto categorium" do
    visit produto_categoria_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @produto_categorium.descricao
    check "Disponivel" if @produto_categorium.disponivel
    fill_in "Empresa", with: @produto_categorium.empresa_id
    click_on "Update Produto categorium"

    assert_text "Produto categorium was successfully updated"
    click_on "Back"
  end

  test "destroying a Produto categorium" do
    visit produto_categoria_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Produto categorium was successfully destroyed"
  end
end
