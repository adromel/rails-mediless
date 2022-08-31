require "test_helper"

class OiltreatmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get oiltreatments_show_url
    assert_response :success
  end
end
