require 'test_helper'

class PermissionFlowActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permission_flow_action = permission_flow_actions(:one)
  end

  test "should get index" do
    get permission_flow_actions_url
    assert_response :success
  end

  test "should get new" do
    get new_permission_flow_action_url
    assert_response :success
  end

  test "should create permission_flow_action" do
    assert_difference('PermissionFlowAction.count') do
      post permission_flow_actions_url, params: { permission_flow_action: { permission_action_id: @permission_flow_action.permission_action_id, permission_flow_id: @permission_flow_action.permission_flow_id } }
    end

    assert_redirected_to permission_flow_action_url(PermissionFlowAction.last)
  end

  test "should show permission_flow_action" do
    get permission_flow_action_url(@permission_flow_action)
    assert_response :success
  end

  test "should get edit" do
    get edit_permission_flow_action_url(@permission_flow_action)
    assert_response :success
  end

  test "should update permission_flow_action" do
    patch permission_flow_action_url(@permission_flow_action), params: { permission_flow_action: { permission_action_id: @permission_flow_action.permission_action_id, permission_flow_id: @permission_flow_action.permission_flow_id } }
    assert_redirected_to permission_flow_action_url(@permission_flow_action)
  end

  test "should destroy permission_flow_action" do
    assert_difference('PermissionFlowAction.count', -1) do
      delete permission_flow_action_url(@permission_flow_action)
    end

    assert_redirected_to permission_flow_actions_url
  end
end
