require "test_helper"

class SetcheckControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get setcheck_index_url
    assert_response :success
  end
end
