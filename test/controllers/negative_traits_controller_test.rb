require 'test_helper'

class NegativeTraitsControllerTest < ActionController::TestCase
  setup do
    @negative_trait = negative_traits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:negative_traits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create negative_trait" do
    assert_difference('NegativeTrait.count') do
      post :create, negative_trait: { details: @negative_trait.details, title: @negative_trait.title }
    end

    assert_redirected_to negative_trait_path(assigns(:negative_trait))
  end

  test "should show negative_trait" do
    get :show, id: @negative_trait
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @negative_trait
    assert_response :success
  end

  test "should update negative_trait" do
    patch :update, id: @negative_trait, negative_trait: { details: @negative_trait.details, title: @negative_trait.title }
    assert_redirected_to negative_trait_path(assigns(:negative_trait))
  end

  test "should destroy negative_trait" do
    assert_difference('NegativeTrait.count', -1) do
      delete :destroy, id: @negative_trait
    end

    assert_redirected_to negative_traits_path
  end
end
