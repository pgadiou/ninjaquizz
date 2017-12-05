class QuizAnswersController < ApplicationController

  def create
    @quiz_answer = QuizAnswer.new(quiz_answer_params)

    if @quiz_answer.save
      redirect_to
    else
      render :new
    end

  end

  private

  def quiz_answer_params
    params.require(:quiz_answer).permit(:quiz_question_id, :answer_id)
  end

end
