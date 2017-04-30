require 'test_helper'

class QuestionsCreationTest < ActionDispatch::IntegrationTest
  
  test "valid question" do
  	get new_path
  	assert_difference 'Question.count', 1 do
  		post new_path, params: { question: { content: "Example Content",
  											 answer: "Example Answer" } }
  	end
  	follow_redirect!
  	assert_template 'questions/show'
  end

  test "invalid question" do
  	get new_path
  	assert_no_difference 'Question.count' do
  		post new_path, params: { question: { content: "",
  											 answer: "" } }
  	end
  	assert_template 'questions/new'
  end
end
