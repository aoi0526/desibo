require "test_helper"

class Company::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get company_users_show_url
    assert_response :success
  end
end
