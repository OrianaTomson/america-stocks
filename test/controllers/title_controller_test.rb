require 'test_helper'

class TitleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get title_index_url
    assert_response :success
  end

end
