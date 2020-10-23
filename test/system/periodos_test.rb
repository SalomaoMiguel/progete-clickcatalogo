require "application_system_test_case"

class PeriodosTest < ApplicationSystemTestCase
  setup do
    @periodo = periodos(:one)
  end

  test "visiting the index" do
    visit periodos_url
    assert_selector "h1", text: "Periodos"
  end

  test "creating a Periodo" do
    visit periodos_url
    click_on "New Periodo"

    fill_in "Dt fin", with: @periodo.dt_fin
    fill_in "Dt ini", with: @periodo.dt_ini
    fill_in "Periodo", with: @periodo.periodo
    fill_in "Plataforma", with: @periodo.plataforma_id
    click_on "Create Periodo"

    assert_text "Periodo was successfully created"
    click_on "Back"
  end

  test "updating a Periodo" do
    visit periodos_url
    click_on "Edit", match: :first

    fill_in "Dt fin", with: @periodo.dt_fin
    fill_in "Dt ini", with: @periodo.dt_ini
    fill_in "Periodo", with: @periodo.periodo
    fill_in "Plataforma", with: @periodo.plataforma_id
    click_on "Update Periodo"

    assert_text "Periodo was successfully updated"
    click_on "Back"
  end

  test "destroying a Periodo" do
    visit periodos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Periodo was successfully destroyed"
  end
end
