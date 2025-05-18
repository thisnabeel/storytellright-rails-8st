require 'test_helper'

class JokeStructuresControllerTest < ActionController::TestCase
  setup do
    @joke_structure = joke_structures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:joke_structures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create joke_structure" do
    assert_difference('JokeStructure.count') do
      post :create, joke_structure: { description: @joke_structure.description, title: @joke_structure.title }
    end

    assert_redirected_to joke_structure_path(assigns(:joke_structure))
  end

  test "should show joke_structure" do
    get :show, id: @joke_structure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @joke_structure
    assert_response :success
  end

  test "should update joke_structure" do
    patch :update, id: @joke_structure, joke_structure: { description: @joke_structure.description, title: @joke_structure.title }
    assert_redirected_to joke_structure_path(assigns(:joke_structure))
  end

  test "should destroy joke_structure" do
    assert_difference('JokeStructure.count', -1) do
      delete :destroy, id: @joke_structure
    end

    assert_redirected_to joke_structures_path
  end
end
