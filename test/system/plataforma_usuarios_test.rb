require "application_system_test_case"

class PlataformaUsuariosTest < ApplicationSystemTestCase
  setup do
    @plataforma_usuario = plataforma_usuarios(:one)
  end

  test "visiting the index" do
    visit plataforma_usuarios_url
    assert_selector "h1", text: "Plataforma Usuarios"
  end

  test "creating a Plataforma usuario" do
    visit plataforma_usuarios_url
    click_on "New Plataforma Usuario"

    check "Ativo" if @plataforma_usuario.ativo
    fill_in "Email", with: @plataforma_usuario.email
    fill_in "Nome", with: @plataforma_usuario.nome
    fill_in "Plataforma id", with: @plataforma_usuario.plataforma_id_id
    fill_in "Senha", with: @plataforma_usuario.senha
    click_on "Create Plataforma usuario"

    assert_text "Plataforma usuario was successfully created"
    click_on "Back"
  end

  test "updating a Plataforma usuario" do
    visit plataforma_usuarios_url
    click_on "Edit", match: :first

    check "Ativo" if @plataforma_usuario.ativo
    fill_in "Email", with: @plataforma_usuario.email
    fill_in "Nome", with: @plataforma_usuario.nome
    fill_in "Plataforma id", with: @plataforma_usuario.plataforma_id_id
    fill_in "Senha", with: @plataforma_usuario.senha
    click_on "Update Plataforma usuario"

    assert_text "Plataforma usuario was successfully updated"
    click_on "Back"
  end

  test "destroying a Plataforma usuario" do
    visit plataforma_usuarios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plataforma usuario was successfully destroyed"
  end
end
