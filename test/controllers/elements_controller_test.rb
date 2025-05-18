require 'test_helper'

class ElementsControllerTest < ActionController::TestCase
  setup do
    @element = elements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:elements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create element" do
    assert_difference('Element.count') do
      post :create, element: { body: @element.body, elementable_id: @element.elementable_id, elementable_type: @element.elementable_type, location: @element.location, position: @element.position, source: @element.source, tags: @element.tags }
    end

    assert_redirected_to element_path(assigns(:element))
  end

  test "should show element" do
    get :show, id: @element
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @element
    assert_response :success
  end

  test "should update element" do
    patch :update, id: @element, element: { body: @element.body, elementable_id: @element.elementable_id, elementable_type: @element.elementable_type, location: @element.location, position: @element.position, source: @element.source, tags: @element.tags }
    assert_redirected_to element_path(assigns(:element))
  end

  test "should destroy element" do
    assert_difference('Element.count', -1) do
      delete :destroy, id: @element
    end

    assert_redirected_to elements_path
  end
end
