require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about-us" do
    get pages_about-us_url
    assert_response :success
  end

  test "should get contact-us" do
    get pages_contact-us_url
    assert_response :success
  end

  test "should get privacy-policy" do
    get pages_privacy-policy_url
    assert_response :success
  end

  test "should get terms-and-conditions" do
    get pages_terms-and-conditions_url
    assert_response :success
  end
end
