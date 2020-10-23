require "application_system_test_case"

class PlataformasTest < ApplicationSystemTestCase
  setup do
    @plataforma = plataformas(:one)
  end

  test "visiting the index" do
    visit plataformas_url
    assert_selector "h1", text: "Plataformas"
  end

  test "creating a Plataforma" do
    visit plataformas_url
    click_on "New Plataforma"

    fill_in "Cnpj", with: @plataforma.cnpj
    fill_in "Descricao", with: @plataforma.descricao
    fill_in "Desenvolvedora", with: @plataforma.desenvolvedora
    click_on "Create Plataforma"

    assert_text "Plataforma was successfully created"
    click_on "Back"
  end

  test "updating a Plataforma" do
    visit plataformas_url
    click_on "Edit", match: :first

    fill_in "Cnpj", with: @plataforma.cnpj
    fill_in "Descricao", with: @plataforma.descricao
    fill_in "Desenvolvedora", with: @plataforma.desenvolvedora
    click_on "Update Plataforma"

    assert_text "Plataforma was successfully updated"
    click_on "Back"
  end

  test "destroying a Plataforma" do
    visit plataformas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plataforma was successfully destroyed"
  end
end
