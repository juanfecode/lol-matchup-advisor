require "test_helper"

class MatchupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get matchups_index_url
    assert_response :success
  end
end
