require "test_helper"

class CreateCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get create_courses_index_url
    assert_response :success
  end
end
