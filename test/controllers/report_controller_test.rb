require 'test_helper'

class ReportControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end


test "should get index" do
    get :index
  	assert_response :success
end

test "should get report" do
    get :request_report
  	assert_response :success
end



end
