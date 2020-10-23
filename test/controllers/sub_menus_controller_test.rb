require 'test_helper'

class SubMenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_menu = sub_menus(:one)
  end

  test "should get index" do
    get sub_menus_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_menu_url
    assert_response :success
  end

  test "should create sub_menu" do
    assert_difference('SubMenu.count') do
      post sub_menus_url, params: { sub_menu: { active: @sub_menu.active, ajax: @sub_menu.ajax, menu_id: @sub_menu.menu_id, name: @sub_menu.name, permission_action_id: @sub_menu.permission_action_id, sub_menu_id: @sub_menu.sub_menu_id } }
    end

    assert_redirected_to sub_menu_url(SubMenu.last)
  end

  test "should show sub_menu" do
    get sub_menu_url(@sub_menu)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_menu_url(@sub_menu)
    assert_response :success
  end

  test "should update sub_menu" do
    patch sub_menu_url(@sub_menu), params: { sub_menu: { active: @sub_menu.active, ajax: @sub_menu.ajax, menu_id: @sub_menu.menu_id, name: @sub_menu.name, permission_action_id: @sub_menu.permission_action_id, sub_menu_id: @sub_menu.sub_menu_id } }
    assert_redirected_to sub_menu_url(@sub_menu)
  end

  test "should destroy sub_menu" do
    assert_difference('SubMenu.count', -1) do
      delete sub_menu_url(@sub_menu)
    end

    assert_redirected_to sub_menus_url
  end
end
