require 'test_helper'

class InspirationControllerTest < ActionController::TestCase
  test "should get hannah" do
    get :hannah
    assert_response :success
  end

end
