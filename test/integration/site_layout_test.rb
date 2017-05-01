require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
 
  test "layout links" do
  	get root_path
  	assert_template 'static_pages/home'
  	assert_select "a[href=?]", new_path
  end

  def setup
  	@question = Question.first
  end

  test "quiz mode layout" do
  	get quiz_path
  	assert_template 'quiz_mode/quiz'
  	assert_select "a[href=?]", new_quiz_path
  	#follow_redirect!
  	get new_quiz_path
  	assert_template 'quiz_mode/show'
  	assert_select "#score", text: "Score: 0"
  	post check_quiz_path, params: { answer: @question.answer, id: @question.id }
  	#follow_redirect!
  	assert_template 'quiz_mode/show'
  	assert_select "#score", text: "Score: 1"
  end
end
