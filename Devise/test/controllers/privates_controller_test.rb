require "test_helper"

class PrivatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get privates_index_url
    assert_response :success
  end
end
