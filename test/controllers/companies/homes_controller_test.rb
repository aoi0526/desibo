require "test_helper"

class Companies::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get companies_homes_top_url
    assert_response :success
  end

  test "should get about" do
    get companies_homes_about_url
    assert_response :success
  end
end
