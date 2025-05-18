require 'test_helper'

class CompanyUsersControllerTest < ActionController::TestCase
  setup do
    @company_user = company_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_user" do
    assert_difference('CompanyUser.count') do
      post :create, company_user: { company_id: @company_user.company_id, user_id: @company_user.user_id }
    end

    assert_redirected_to company_user_path(assigns(:company_user))
  end

  test "should show company_user" do
    get :show, id: @company_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_user
    assert_response :success
  end

  test "should update company_user" do
    patch :update, id: @company_user, company_user: { company_id: @company_user.company_id, user_id: @company_user.user_id }
    assert_redirected_to company_user_path(assigns(:company_user))
  end

  test "should destroy company_user" do
    assert_difference('CompanyUser.count', -1) do
      delete :destroy, id: @company_user
    end

    assert_redirected_to company_users_path
  end
end
