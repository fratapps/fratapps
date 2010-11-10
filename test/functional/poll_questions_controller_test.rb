require 'test_helper'

class PollQuestionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poll_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll_question" do
    assert_difference('PollQuestion.count') do
      post :create, :poll_question => { }
    end

    assert_redirected_to poll_question_path(assigns(:poll_question))
  end

  test "should show poll_question" do
    get :show, :id => poll_questions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => poll_questions(:one).to_param
    assert_response :success
  end

  test "should update poll_question" do
    put :update, :id => poll_questions(:one).to_param, :poll_question => { }
    assert_redirected_to poll_question_path(assigns(:poll_question))
  end

  test "should destroy poll_question" do
    assert_difference('PollQuestion.count', -1) do
      delete :destroy, :id => poll_questions(:one).to_param
    end

    assert_redirected_to poll_questions_path
  end
end
