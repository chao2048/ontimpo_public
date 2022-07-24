require "test_helper"

class WreportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wreports_index_url
    assert_response :success
  end
end
