require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
  	@question = Question.new(content: "Example Content", answer: "Example Answer")
  end

  test "should be valid" do
	 assert @question.valid?  	
  end

  test "content should be present" do
  	@question.content = ""
	assert_not @question.valid?  	
  end

  test "answer should be present" do
  	@question.answer = ""
	assert_not @question.valid?  	
  end
end
