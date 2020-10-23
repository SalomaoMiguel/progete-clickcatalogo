require "application_system_test_case"

class CepsTest < ApplicationSystemTestCase
  setup do
    @cep = ceps(:one)
  end

  test "visiting the index" do
    visit ceps_url
    assert_selector "h1", text: "Ceps"
  end

  test "creating a Cep" do
    visit ceps_url
    click_on "New Cep"

    check "Active" if @cep.active
    fill_in "Bairro", with: @cep.bairro_id
    fill_in "Latitude", with: @cep.latitude
    fill_in "Logadouro", with: @cep.logadouro
    fill_in "Longitude", with: @cep.longitude
    fill_in "Ref", with: @cep.ref
    fill_in "Tipo", with: @cep.tipo
    click_on "Create Cep"

    assert_text "Cep was successfully created"
    click_on "Back"
  end

  test "updating a Cep" do
    visit ceps_url
    click_on "Edit", match: :first

    check "Active" if @cep.active
    fill_in "Bairro", with: @cep.bairro_id
    fill_in "Latitude", with: @cep.latitude
    fill_in "Logadouro", with: @cep.logadouro
    fill_in "Longitude", with: @cep.longitude
    fill_in "Ref", with: @cep.ref
    fill_in "Tipo", with: @cep.tipo
    click_on "Update Cep"

    assert_text "Cep was successfully updated"
    click_on "Back"
  end

  test "destroying a Cep" do
    visit ceps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cep was successfully destroyed"
  end
end
