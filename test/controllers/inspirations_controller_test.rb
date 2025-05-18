require 'test_helper'

class InspirationsControllerTest < ActionController::TestCase
  setup do
    @inspiration = inspirations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inspirations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inspiration" do
    assert_difference('Inspiration.count') do
      post :create, inspiration: { body: @inspiration.body, inspirable_id: @inspiration.inspirable_id, inspirable_type: @inspiration.inspirable_type, location: @inspiration.location, position: @inspiration.position, tags: @inspiration.tags }
    end

    assert_redirected_to inspiration_path(assigns(:inspiration))
  end

  test "should show inspiration" do
    get :show, id: @inspiration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inspiration
    assert_response :success
  end

  test "should update inspiration" do
    patch :update, id: @inspiration, inspiration: { body: @inspiration.body, inspirable_id: @inspiration.inspirable_id, inspirable_type: @inspiration.inspirable_type, location: @inspiration.location, position: @inspiration.position, tags: @inspiration.tags }
    assert_redirected_to inspiration_path(assigns(:inspiration))
  end

  test "should destroy inspiration" do
    assert_difference('Inspiration.count', -1) do
      delete :destroy, id: @inspiration
    end

    assert_redirected_to inspirations_path
  end
end
