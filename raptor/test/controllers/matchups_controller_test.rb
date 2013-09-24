require 'test_helper'

class MatchupsControllerTest < ActionController::TestCase
  setup do
    @matchup = matchups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matchups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matchup" do
    assert_difference('Matchup.count') do
      post :create, matchup: { away_id: @matchup.away_id, away_symbol: @matchup.away_symbol, home_id: @matchup.home_id, home_symbol: @matchup.home_symbol, home_symbol: @matchup.home_symbol, time: @matchup.time }
    end

    assert_redirected_to matchup_path(assigns(:matchup))
  end

  test "should show matchup" do
    get :show, id: @matchup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matchup
    assert_response :success
  end

  test "should update matchup" do
    patch :update, id: @matchup, matchup: { away_id: @matchup.away_id, away_symbol: @matchup.away_symbol, home_id: @matchup.home_id, home_symbol: @matchup.home_symbol, home_symbol: @matchup.home_symbol, time: @matchup.time }
    assert_redirected_to matchup_path(assigns(:matchup))
  end

  test "should destroy matchup" do
    assert_difference('Matchup.count', -1) do
      delete :destroy, id: @matchup
    end

    assert_redirected_to matchups_path
  end
end
