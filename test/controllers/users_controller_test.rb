require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include AuthorizationHelper

  setup do
    @user = users(:one)
    @auth_token = auth_tokens_for_user(users(:sample).email, "123123123")
  end

  test "should get index" do
    get users_url, as: :json, headers: { "HTTP_AUTHORIZATION" => "Bearer #{@auth_token}" }
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, password: "testpassword", password_confirmation: "testpassword", folio: @user.folio, name: @user.name, phone: @user.phone } }, as: :json
    end

    response_body = JSON.parse(response.body)
    assert_response 200
    assert response_body["auth_token"].present?
  end

  test "should show user" do
    get user_url(@user), as: :json, headers: { "HTTP_AUTHORIZATION" => "Bearer #{@auth_token}" }
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { folio: @user.folio, name: @user.name, phone: @user.phone } }, as: :json, headers: { "HTTP_AUTHORIZATION" => "Bearer #{@auth_token}" }
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json, headers: { "HTTP_AUTHORIZATION" => "Bearer #{@auth_token}" }
    end

    assert_response 204
  end
end
