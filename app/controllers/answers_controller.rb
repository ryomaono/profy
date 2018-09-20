class AnswersController < ApplicationController

  before_action :redirect, only: :new

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    @answer.question_id = @question.id
  end

  def create
    @answer = Answer.create(answer_params)
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def update
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.update(update_params)

  private
  def answer_params
    params.require(:answer).permit(:question_id, :text).merge(user_id: current_user.id)
  end

  def redirect
    if Answer.exists?(question_id: params[:question_id], user_id: current_user.id)
      redirect_to :root
    end
  end

  def update_params
    params.require.(:answer).permit(:text)
  end
end
