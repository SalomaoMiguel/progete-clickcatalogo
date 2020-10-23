require "application_system_test_case"

class PermissionFlowsTest < ApplicationSystemTestCase
  setup do
    @permission_flow = permission_flows(:one)
  end

  test "visiting the index" do
    visit permission_flows_url
    assert_selector "h1", text: "Permission Flows"
  end

  test "creating a Permission flow" do
    visit permission_flows_url
    click_on "New Permission Flow"

    fill_in "Name", with: @permission_flow.name
    fill_in "Sub menu", with: @permission_flow.sub_menu_id
    click_on "Create Permission flow"

    assert_text "Permission flow was successfully created"
    click_on "Back"
  end

  test "updating a Permission flow" do
    visit permission_flows_url
    click_on "Edit", match: :first

    fill_in "Name", with: @permission_flow.name
    fill_in "Sub menu", with: @permission_flow.sub_menu_id
    click_on "Update Permission flow"

    assert_text "Permission flow was successfully updated"
    click_on "Back"
  end

  test "destroying a Permission flow" do
    visit permission_flows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Permission flow was successfully destroyed"
  end
end
