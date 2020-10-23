require "application_system_test_case"

class BairrosTest < ApplicationSystemTestCase
  setup do
    @bairro = bairros(:one)
  end

  test "visiting the index" do
    visit bairros_url
    assert_selector "h1", text: "Bairros"
  end

  test "creating a Bairro" do
    visit bairros_url
    click_on "New Bairro"

    fill_in "City", with: @bairro.city_id
    fill_in "Descricao", with: @bairro.descricao
    fill_in "Latitude", with: @bairro.latitude
    fill_in "Longitude", with: @bairro.longitude
    fill_in "Ref", with: @bairro.ref
    click_on "Create Bairro"

    assert_text "Bairro was successfully created"
    click_on "Back"
  end

  test "updating a Bairro" do
    visit bairros_url
    click_on "Edit", match: :first

    fill_in "City", with: @bairro.city_id
    fill_in "Descricao", with: @bairro.descricao
    fill_in "Latitude", with: @bairro.latitude
    fill_in "Longitude", with: @bairro.longitude
    fill_in "Ref", with: @bairro.ref
    click_on "Update Bairro"

    assert_text "Bairro was successfully updated"
    click_on "Back"
  end

  test "destroying a Bairro" do
    visit bairros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bairro was successfully destroyed"
  end
end
