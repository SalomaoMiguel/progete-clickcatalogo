require "application_system_test_case"

class EmpresasTest < ApplicationSystemTestCase
  setup do
    @empresa = empresas(:one)
  end

  test "visiting the index" do
    visit empresas_url
    assert_selector "h1", text: "Empresas"
  end

  test "creating a Empresa" do
    visit empresas_url
    click_on "New Empresa"

    fill_in "Celular", with: @empresa.celular
    fill_in "Cidade", with: @empresa.cidade
    fill_in "Cnpj cpf", with: @empresa.cnpj_cpf
    fill_in "Cor layout", with: @empresa.cor_layout
    fill_in "Email", with: @empresa.email
    fill_in "Empresa seguimento", with: @empresa.empresa_seguimento_id
    fill_in "Endereco", with: @empresa.endereco
    fill_in "Fb url", with: @empresa.fb_url
    fill_in "Insta url", with: @empresa.insta_url
    fill_in "Logomarca", with: @empresa.logomarca
    fill_in "Loja", with: @empresa.loja_id
    fill_in "Pint url", with: @empresa.pint_url
    fill_in "Plano", with: @empresa.plano_id
    fill_in "Razao", with: @empresa.razao
    fill_in "Sobre", with: @empresa.sobre
    fill_in "Telefone", with: @empresa.telefone
    fill_in "Web site", with: @empresa.web_site
    click_on "Create Empresa"

    assert_text "Empresa was successfully created"
    click_on "Back"
  end

  test "updating a Empresa" do
    visit empresas_url
    click_on "Edit", match: :first

    fill_in "Celular", with: @empresa.celular
    fill_in "Cidade", with: @empresa.cidade
    fill_in "Cnpj cpf", with: @empresa.cnpj_cpf
    fill_in "Cor layout", with: @empresa.cor_layout
    fill_in "Email", with: @empresa.email
    fill_in "Empresa seguimento", with: @empresa.empresa_seguimento_id
    fill_in "Endereco", with: @empresa.endereco
    fill_in "Fb url", with: @empresa.fb_url
    fill_in "Insta url", with: @empresa.insta_url
    fill_in "Logomarca", with: @empresa.logomarca
    fill_in "Loja", with: @empresa.loja_id
    fill_in "Pint url", with: @empresa.pint_url
    fill_in "Plano", with: @empresa.plano_id
    fill_in "Razao", with: @empresa.razao
    fill_in "Sobre", with: @empresa.sobre
    fill_in "Telefone", with: @empresa.telefone
    fill_in "Web site", with: @empresa.web_site
    click_on "Update Empresa"

    assert_text "Empresa was successfully updated"
    click_on "Back"
  end

  test "destroying a Empresa" do
    visit empresas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empresa was successfully destroyed"
  end
end
