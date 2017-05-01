class QuizModeController < ApplicationController
  
  def quiz
  end

  def show
  	
  end

  def new_quiz
    @@score ||= 0
  	@question = Question.all.to_a.shuffle.first
  	@answer = Question.new
  	@answer.content = @question.content
  	@answer.id = @question.id
  	render 'show'
  end

  def check_quiz
  	@answer = Question.new(quiz_params)
  	@question = Question.find(params[:id])
  	if @answer.answer == @question.answer
      flash[:success] = "Correct!"
      @@score = @@score + 1
      new_quiz()
  	else
      flash[:success] = "Incorrect! The correct answer is " + @question.answer + "."
  		new_quiz()
  	end
  end

  helper_method :score

  def score
    @@score
  end
  
  private

  	def quiz_params
  		params.permit(:answer, :id)
  	end
end
