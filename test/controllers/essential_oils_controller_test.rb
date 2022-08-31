require "test_helper"

class EssentialOilsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get essential_oils_show_url
    assert_response :success
  end
end
