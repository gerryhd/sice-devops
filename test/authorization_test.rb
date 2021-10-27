require 'test_helper'

class AuthorizationTest < ActionDispatch::IntegrationTest
  include AuthorizationHelper

  setup do
    @user = users(:sample)
  end

  test "log in sample user" do
    auth_tokens_for_user(@user.email, "123123123")
    assert_response :success
  end
end
