require "test_helper"

class User::NotificationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_notification_index_url
    assert_response :success
  end
end
