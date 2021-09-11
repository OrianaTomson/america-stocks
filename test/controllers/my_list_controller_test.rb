require 'test_helper'

class MyListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_list_index_url
    assert_response :success
  end

end
