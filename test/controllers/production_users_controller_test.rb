require 'test_helper'

class ProductionUsersControllerTest < ActionController::TestCase
  setup do
    @production_user = production_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_user" do
    assert_difference('ProductionUser.count') do
      post :create, production_user: { production_id: @production_user.production_id, role: @production_user.role, user_id: @production_user.user_id }
    end

    assert_redirected_to production_user_path(assigns(:production_user))
  end

  test "should show production_user" do
    get :show, id: @production_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_user
    assert_response :success
  end

  test "should update production_user" do
    patch :update, id: @production_user, production_user: { production_id: @production_user.production_id, role: @production_user.role, user_id: @production_user.user_id }
    assert_redirected_to production_user_path(assigns(:production_user))
  end

  test "should destroy production_user" do
    assert_difference('ProductionUser.count', -1) do
      delete :destroy, id: @production_user
    end

    assert_redirected_to production_users_path
  end
end
