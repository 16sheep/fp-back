require 'test_helper'

class FestivalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @festival = festivals(:one)
  end

  test "should get index" do
    get festivals_url, as: :json
    assert_response :success
  end

  test "should create festival" do
    assert_difference('Festival.count') do
      post festivals_url, params: { festival: { date_from: @festival.date_from, date_until: @festival.date_until, location: @festival.location, logo_img: @festival.logo_img, map_img: @festival.map_img, name: @festival.name, secret: @festival.secret, user_id: @festival.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show festival" do
    get festival_url(@festival), as: :json
    assert_response :success
  end

  test "should update festival" do
    patch festival_url(@festival), params: { festival: { date_from: @festival.date_from, date_until: @festival.date_until, location: @festival.location, logo_img: @festival.logo_img, map_img: @festival.map_img, name: @festival.name, secret: @festival.secret, user_id: @festival.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy festival" do
    assert_difference('Festival.count', -1) do
      delete festival_url(@festival), as: :json
    end

    assert_response 204
  end
end
