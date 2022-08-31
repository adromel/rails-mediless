require "test_helper"

class AcuPointsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get acu_points_show_url
    assert_response :success
  end
end
