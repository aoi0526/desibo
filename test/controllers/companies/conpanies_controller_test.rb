require "test_helper"

class Companies::ConpaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get companies_conpanies_show_url
    assert_response :success
  end

  test "should get edit" do
    get companies_conpanies_edit_url
    assert_response :success
  end
end
