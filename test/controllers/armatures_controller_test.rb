require 'test_helper'

class ArmaturesControllerTest < ActionController::TestCase
  setup do
    @armature = armatures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:armatures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create armature" do
    assert_difference('Armature.count') do
      post :create, armature: { string: @armature.string }
    end

    assert_redirected_to armature_path(assigns(:armature))
  end

  test "should show armature" do
    get :show, id: @armature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @armature
    assert_response :success
  end

  test "should update armature" do
    patch :update, id: @armature, armature: { string: @armature.string }
    assert_redirected_to armature_path(assigns(:armature))
  end

  test "should destroy armature" do
    assert_difference('Armature.count', -1) do
      delete :destroy, id: @armature
    end

    assert_redirected_to armatures_path
  end
end
