require "test_helper"

class LineitemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lineitems_index_url
    assert_response :success
  end
end
