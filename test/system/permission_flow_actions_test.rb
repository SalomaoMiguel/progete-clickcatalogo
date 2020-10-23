require "application_system_test_case"

class PermissionFlowActionsTest < ApplicationSystemTestCase
  setup do
    @permission_flow_action = permission_flow_actions(:one)
  end

  test "visiting the index" do
    visit permission_flow_actions_url
    assert_selector "h1", text: "Permission Flow Actions"
  end

  test "creating a Permission flow action" do
    visit permission_flow_actions_url
    click_on "New Permission Flow Action"

    fill_in "Permission action", with: @permission_flow_action.permission_action_id
    fill_in "Permission flow", with: @permission_flow_action.permission_flow_id
    click_on "Create Permission flow action"

    assert_text "Permission flow action was successfully created"
    click_on "Back"
  end

  test "updating a Permission flow action" do
    visit permission_flow_actions_url
    click_on "Edit", match: :first

    fill_in "Permission action", with: @permission_flow_action.permission_action_id
    fill_in "Permission flow", with: @permission_flow_action.permission_flow_id
    click_on "Update Permission flow action"

    assert_text "Permission flow action was successfully updated"
    click_on "Back"
  end

  test "destroying a Permission flow action" do
    visit permission_flow_actions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Permission flow action was successfully destroyed"
  end
end
