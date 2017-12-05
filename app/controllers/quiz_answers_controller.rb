class QuizAnswersController < ApplicationController

  def create
    @quiz_answer = QuizAnswer.new(quiz_answer_params)
    @quiz_answer.answer_id = answer.id
    @quiz_answer.save
  end

  private

  def quiz_answer_params
    params.require(:quiz_answer).permit(:quiz_question_id)
  end

end
