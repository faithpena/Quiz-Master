require 'test_helper'

class QuizModeControllerTest < ActionDispatch::IntegrationTest
  test "should get quiz" do
    get quiz_path
    assert_response :success
  end

  test "should get new quiz" do
  	get new_quiz_path
  	assert_response :success
  end
end
