require "test_helper"

class Company::NotificationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get company_notification_index_url
    assert_response :success
  end
end
