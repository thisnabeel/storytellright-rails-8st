require 'test_helper'

class RiffsControllerTest < ActionController::TestCase
  setup do
    @riff = riffs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:riffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create riff" do
    assert_difference('Riff.count') do
      post :create, riff: { demo: @riff.demo, guide: @riff.guide, position: @riff.position, tags: @riff.tags, title: @riff.title }
    end

    assert_redirected_to riff_path(assigns(:riff))
  end

  test "should show riff" do
    get :show, id: @riff
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @riff
    assert_response :success
  end

  test "should update riff" do
    patch :update, id: @riff, riff: { demo: @riff.demo, guide: @riff.guide, position: @riff.position, tags: @riff.tags, title: @riff.title }
    assert_redirected_to riff_path(assigns(:riff))
  end

  test "should destroy riff" do
    assert_difference('Riff.count', -1) do
      delete :destroy, id: @riff
    end

    assert_redirected_to riffs_path
  end
end
