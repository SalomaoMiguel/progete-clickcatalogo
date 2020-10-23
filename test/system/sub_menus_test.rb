require "application_system_test_case"

class SubMenusTest < ApplicationSystemTestCase
  setup do
    @sub_menu = sub_menus(:one)
  end

  test "visiting the index" do
    visit sub_menus_url
    assert_selector "h1", text: "Sub Menus"
  end

  test "creating a Sub menu" do
    visit sub_menus_url
    click_on "New Sub Menu"

    check "Active" if @sub_menu.active
    check "Ajax" if @sub_menu.ajax
    fill_in "Menu", with: @sub_menu.menu_id
    fill_in "Name", with: @sub_menu.name
    fill_in "Permission action", with: @sub_menu.permission_action_id
    fill_in "Sub menu", with: @sub_menu.sub_menu_id
    click_on "Create Sub menu"

    assert_text "Sub menu was successfully created"
    click_on "Back"
  end

  test "updating a Sub menu" do
    visit sub_menus_url
    click_on "Edit", match: :first

    check "Active" if @sub_menu.active
    check "Ajax" if @sub_menu.ajax
    fill_in "Menu", with: @sub_menu.menu_id
    fill_in "Name", with: @sub_menu.name
    fill_in "Permission action", with: @sub_menu.permission_action_id
    fill_in "Sub menu", with: @sub_menu.sub_menu_id
    click_on "Update Sub menu"

    assert_text "Sub menu was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub menu" do
    visit sub_menus_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub menu was successfully destroyed"
  end
end
