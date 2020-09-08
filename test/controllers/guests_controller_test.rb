require 'test_helper'

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guests_index_url
    assert_response :success
  end

  test "should get create" do
    get guests_create_url
    assert_response :success
  end

end
