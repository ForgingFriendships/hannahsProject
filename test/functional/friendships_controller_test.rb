require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase
  test "should get program" do
    get :program
    assert_response :success
  end

end
