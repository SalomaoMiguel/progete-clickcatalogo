require "application_system_test_case"

class EmpresaUsuariosTest < ApplicationSystemTestCase
  setup do
    @empresa_usuario = empresa_usuarios(:one)
  end

  test "visiting the index" do
    visit empresa_usuarios_url
    assert_selector "h1", text: "Empresa Usuarios"
  end

  test "creating a Empresa usuario" do
    visit empresa_usuarios_url
    click_on "New Empresa Usuario"

    fill_in "Email", with: @empresa_usuario.email
    check "Email validado" if @empresa_usuario.email_validado
    fill_in "Empresa", with: @empresa_usuario.empresa_id
    fill_in "Nome", with: @empresa_usuario.nome
    fill_in "Senha", with: @empresa_usuario.senha
    fill_in "Telefone", with: @empresa_usuario.telefone
    click_on "Create Empresa usuario"

    assert_text "Empresa usuario was successfully created"
    click_on "Back"
  end

  test "updating a Empresa usuario" do
    visit empresa_usuarios_url
    click_on "Edit", match: :first

    fill_in "Email", with: @empresa_usuario.email
    check "Email validado" if @empresa_usuario.email_validado
    fill_in "Empresa", with: @empresa_usuario.empresa_id
    fill_in "Nome", with: @empresa_usuario.nome
    fill_in "Senha", with: @empresa_usuario.senha
    fill_in "Telefone", with: @empresa_usuario.telefone
    click_on "Update Empresa usuario"

    assert_text "Empresa usuario was successfully updated"
    click_on "Back"
  end

  test "destroying a Empresa usuario" do
    visit empresa_usuarios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empresa usuario was successfully destroyed"
  end
end
