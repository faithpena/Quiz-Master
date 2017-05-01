class QuizModeController < ApplicationController
  
  def quiz
    get_new_question
    render 'show'
  end

  def show
  end

  def check_quiz
  	@answer = Question.new(quiz_params)
  	@question = Question.find(params[:id])
  	if @answer.answer.downcase.squish == @question.answer.downcase.squish || (NumbersInWords.in_numbers(@answer.answer)).to_s.downcase.squish == @question.answer.downcase.squish
      flash[:success] = "Correct!"
      update_score
      redirect_to quiz_path
  	else
      flash[:warning] = "Incorrect! The correct answer is " + @question.answer + "."
      flash[:danger] = "Game Over. Your final score is #{session[:score]}"
      delete_score
  		redirect_to current_user
  	end
  end

  def get_new_question
    @question = Question.all.to_a.shuffle.first
    @answer = Question.new
    @answer.content = @question.content
    @answer.id = @question.id
  end
  
  private

  	def quiz_params
  		params.permit(:answer, :id)
  	end
end
