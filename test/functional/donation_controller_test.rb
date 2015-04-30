require 'test_helper'

class DonationControllerTest < ActionController::TestCase
  test "should get donate" do
    get :donate
    assert_response :success
  end

end
