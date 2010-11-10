require 'test_helper'

class PollVotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poll_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll_vote" do
    assert_difference('PollVote.count') do
      post :create, :poll_vote => { }
    end

    assert_redirected_to poll_vote_path(assigns(:poll_vote))
  end

  test "should show poll_vote" do
    get :show, :id => poll_votes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => poll_votes(:one).to_param
    assert_response :success
  end

  test "should update poll_vote" do
    put :update, :id => poll_votes(:one).to_param, :poll_vote => { }
    assert_redirected_to poll_vote_path(assigns(:poll_vote))
  end

  test "should destroy poll_vote" do
    assert_difference('PollVote.count', -1) do
      delete :destroy, :id => poll_votes(:one).to_param
    end

    assert_redirected_to poll_votes_path
  end
end
