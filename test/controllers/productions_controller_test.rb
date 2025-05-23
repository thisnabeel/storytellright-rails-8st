require 'test_helper'

class ProductionsControllerTest < ActionController::TestCase
  setup do
    @production = productions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production" do
    assert_difference('Production.count') do
      post :create, production: { company_id: @production.company_id, productionable_id: @production.productionable_id, productionable_type: @production.productionable_type }
    end

    assert_redirected_to production_path(assigns(:production))
  end

  test "should show production" do
    get :show, id: @production
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production
    assert_response :success
  end

  test "should update production" do
    patch :update, id: @production, production: { company_id: @production.company_id, productionable_id: @production.productionable_id, productionable_type: @production.productionable_type }
    assert_redirected_to production_path(assigns(:production))
  end

  test "should destroy production" do
    assert_difference('Production.count', -1) do
      delete :destroy, id: @production
    end

    assert_redirected_to productions_path
  end
end
