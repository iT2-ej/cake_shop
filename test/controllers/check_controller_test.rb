require "test_helper"

class CheckControllerTest < ActionDispatch::IntegrationTest
  test "should get public/items" do
    get check_public/items_url
    assert_response :success
  end
end
