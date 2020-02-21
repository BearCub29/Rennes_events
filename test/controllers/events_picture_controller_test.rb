require 'test_helper'

class EventsPictureControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get events_picture_create_url
    assert_response :success
  end

end
