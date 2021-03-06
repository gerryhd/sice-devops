require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  include AuthorizationHelper

  setup do
    @course = courses(:one)
    @auth_token = auth_tokens_for_user(users(:sample).email, "123123123")
  end

  test "should get index" do
    get courses_url, as: :json, headers: { "HTTP_AUTHORIZATION" => "Bearer #{@auth_token}" }
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post courses_url, params: { course: { description: @course.description, name: @course.name } }, as: :json, headers: { "HTTP_AUTHORIZATION" => "Bearer #{@auth_token}" }
    end

    assert_response 201
  end

  test "should show course" do
    get course_url(@course), as: :json, headers: { "HTTP_AUTHORIZATION" => "Bearer #{@auth_token}" }
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course), params: { course: { description: @course.description, name: @course.name } }, as: :json, headers: { "HTTP_AUTHORIZATION" => "Bearer #{@auth_token}" }
    assert_response 200
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course), as: :json, headers: { "HTTP_AUTHORIZATION" => "Bearer #{@auth_token}" }
    end

    assert_response 204
  end
end
