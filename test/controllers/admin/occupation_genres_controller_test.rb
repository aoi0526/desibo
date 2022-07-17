require "test_helper"

class Admin::OccupationGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_occupation_genres_index_url
    assert_response :success
  end
end
