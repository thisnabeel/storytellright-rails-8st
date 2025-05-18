require 'test_helper'

class DiscussionAnswersControllerTest < ActionController::TestCase
  setup do
    @discussion_answer = discussion_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discussion_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discussion_answer" do
    assert_difference('DiscussionAnswer.count') do
      post :create, discussion_answer: { body: @discussion_answer.body, discussion_question_id: @discussion_answer.discussion_question_id, user_id: @discussion_answer.user_id }
    end

    assert_redirected_to discussion_answer_path(assigns(:discussion_answer))
  end

  test "should show discussion_answer" do
    get :show, id: @discussion_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discussion_answer
    assert_response :success
  end

  test "should update discussion_answer" do
    patch :update, id: @discussion_answer, discussion_answer: { body: @discussion_answer.body, discussion_question_id: @discussion_answer.discussion_question_id, user_id: @discussion_answer.user_id }
    assert_redirected_to discussion_answer_path(assigns(:discussion_answer))
  end

  test "should destroy discussion_answer" do
    assert_difference('DiscussionAnswer.count', -1) do
      delete :destroy, id: @discussion_answer
    end

    assert_redirected_to discussion_answers_path
  end
end
