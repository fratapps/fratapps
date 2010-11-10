require 'test_helper'

class PollAnswersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poll_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll_answer" do
    assert_difference('PollAnswer.count') do
      post :create, :poll_answer => { }
    end

    assert_redirected_to poll_answer_path(assigns(:poll_answer))
  end

  test "should show poll_answer" do
    get :show, :id => poll_answers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => poll_answers(:one).to_param
    assert_response :success
  end

  test "should update poll_answer" do
    put :update, :id => poll_answers(:one).to_param, :poll_answer => { }
    assert_redirected_to poll_answer_path(assigns(:poll_answer))
  end

  test "should destroy poll_answer" do
    assert_difference('PollAnswer.count', -1) do
      delete :destroy, :id => poll_answers(:one).to_param
    end

    assert_redirected_to poll_answers_path
  end
end
