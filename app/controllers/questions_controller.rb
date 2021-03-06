class QuestionsController < ApplicationController

  def show
  	@question = Question.find(params[:id])
  end

  def new
  	@question = Question.new
  end

  def create
  	@question = Question.new(question_params)
  	if @question.save
  		redirect_to current_user
  	else
  		render 'new'
  	end
  end

  private

  	def question_params
  		params.require(:question).permit(:content, :answer)
  	end

end
