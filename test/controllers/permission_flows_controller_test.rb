require 'test_helper'

class PermissionFlowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permission_flow = permission_flows(:one)
  end

  test "should get index" do
    get permission_flows_url
    assert_response :success
  end

  test "should get new" do
    get new_permission_flow_url
    assert_response :success
  end

  test "should create permission_flow" do
    assert_difference('PermissionFlow.count') do
      post permission_flows_url, params: { permission_flow: { name: @permission_flow.name, sub_menu_id: @permission_flow.sub_menu_id } }
    end

    assert_redirected_to permission_flow_url(PermissionFlow.last)
  end

  test "should show permission_flow" do
    get permission_flow_url(@permission_flow)
    assert_response :success
  end

  test "should get edit" do
    get edit_permission_flow_url(@permission_flow)
    assert_response :success
  end

  test "should update permission_flow" do
    patch permission_flow_url(@permission_flow), params: { permission_flow: { name: @permission_flow.name, sub_menu_id: @permission_flow.sub_menu_id } }
    assert_redirected_to permission_flow_url(@permission_flow)
  end

  test "should destroy permission_flow" do
    assert_difference('PermissionFlow.count', -1) do
      delete permission_flow_url(@permission_flow)
    end

    assert_redirected_to permission_flows_url
  end
end
