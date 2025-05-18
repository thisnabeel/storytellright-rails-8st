require 'test_helper'

class ChordProgressionsControllerTest < ActionController::TestCase
  setup do
    @chord_progression = chord_progressions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chord_progressions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chord_progression" do
    assert_difference('ChordProgression.count') do
      post :create, chord_progression: { progression: @chord_progression.progression, scale: @chord_progression.scale, tags: @chord_progression.tags, title: @chord_progression.title }
    end

    assert_redirected_to chord_progression_path(assigns(:chord_progression))
  end

  test "should show chord_progression" do
    get :show, id: @chord_progression
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chord_progression
    assert_response :success
  end

  test "should update chord_progression" do
    patch :update, id: @chord_progression, chord_progression: { progression: @chord_progression.progression, scale: @chord_progression.scale, tags: @chord_progression.tags, title: @chord_progression.title }
    assert_redirected_to chord_progression_path(assigns(:chord_progression))
  end

  test "should destroy chord_progression" do
    assert_difference('ChordProgression.count', -1) do
      delete :destroy, id: @chord_progression
    end

    assert_redirected_to chord_progressions_path
  end
end
