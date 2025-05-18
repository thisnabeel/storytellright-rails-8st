require 'test_helper'

class JokeTriggersControllerTest < ActionController::TestCase
  setup do
    @joke_trigger = joke_triggers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:joke_triggers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create joke_trigger" do
    assert_difference('JokeTrigger.count') do
      post :create, joke_trigger: { description: @joke_trigger.description, title: @joke_trigger.title }
    end

    assert_redirected_to joke_trigger_path(assigns(:joke_trigger))
  end

  test "should show joke_trigger" do
    get :show, id: @joke_trigger
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @joke_trigger
    assert_response :success
  end

  test "should update joke_trigger" do
    patch :update, id: @joke_trigger, joke_trigger: { description: @joke_trigger.description, title: @joke_trigger.title }
    assert_redirected_to joke_trigger_path(assigns(:joke_trigger))
  end

  test "should destroy joke_trigger" do
    assert_difference('JokeTrigger.count', -1) do
      delete :destroy, id: @joke_trigger
    end

    assert_redirected_to joke_triggers_path
  end
end
