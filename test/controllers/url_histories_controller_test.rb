require "test_helper"

class UrlHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get url_histories_index_url
    assert_response :success
  end
end
