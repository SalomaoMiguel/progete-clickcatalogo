require "application_system_test_case"

class ProdutosTest < ApplicationSystemTestCase
  setup do
    @produto = produtos(:one)
  end

  test "visiting the index" do
    visit produtos_url
    assert_selector "h1", text: "Produtos"
  end

  test "creating a Produto" do
    visit produtos_url
    click_on "New Produto"

    check "Deletado" if @produto.deletado
    fill_in "Descricao", with: @produto.descricao
    check "Disponivel" if @produto.disponivel
    fill_in "Empresa", with: @produto.empresa_id
    fill_in "Especificacao", with: @produto.especificacao
    fill_in "Preco", with: @produto.preco
    fill_in "Produto categoria", with: @produto.produto_categoria_id
    check "Promocao" if @produto.promocao
    click_on "Create Produto"

    assert_text "Produto was successfully created"
    click_on "Back"
  end

  test "updating a Produto" do
    visit produtos_url
    click_on "Edit", match: :first

    check "Deletado" if @produto.deletado
    fill_in "Descricao", with: @produto.descricao
    check "Disponivel" if @produto.disponivel
    fill_in "Empresa", with: @produto.empresa_id
    fill_in "Especificacao", with: @produto.especificacao
    fill_in "Preco", with: @produto.preco
    fill_in "Produto categoria", with: @produto.produto_categoria_id
    check "Promocao" if @produto.promocao
    click_on "Update Produto"

    assert_text "Produto was successfully updated"
    click_on "Back"
  end

  test "destroying a Produto" do
    visit produtos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Produto was successfully destroyed"
  end
end
