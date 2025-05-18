require 'test_helper'

class StoryMapsControllerTest < ActionController::TestCase
  setup do
    @story_map = story_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:story_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create story_map" do
    assert_difference('StoryMap.count') do
      post :create, story_map: { string: @story_map.string, text: @story_map.text }
    end

    assert_redirected_to story_map_path(assigns(:story_map))
  end

  test "should show story_map" do
    get :show, id: @story_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @story_map
    assert_response :success
  end

  test "should update story_map" do
    patch :update, id: @story_map, story_map: { string: @story_map.string, text: @story_map.text }
    assert_redirected_to story_map_path(assigns(:story_map))
  end

  test "should destroy story_map" do
    assert_difference('StoryMap.count', -1) do
      delete :destroy, id: @story_map
    end

    assert_redirected_to story_maps_path
  end
end
