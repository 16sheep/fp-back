require 'test_helper'

class UserFestivalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_festival = user_festivals(:one)
  end

  test "should get index" do
    get user_festivals_url, as: :json
    assert_response :success
  end

  test "should create user_festival" do
    assert_difference('UserFestival.count') do
      post user_festivals_url, params: { user_festival: { festival_id: @user_festival.festival_id, integer: @user_festival.integer, user_id: @user_festival.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_festival" do
    get user_festival_url(@user_festival), as: :json
    assert_response :success
  end

  test "should update user_festival" do
    patch user_festival_url(@user_festival), params: { user_festival: { festival_id: @user_festival.festival_id, integer: @user_festival.integer, user_id: @user_festival.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_festival" do
    assert_difference('UserFestival.count', -1) do
      delete user_festival_url(@user_festival), as: :json
    end

    assert_response 204
  end
end
