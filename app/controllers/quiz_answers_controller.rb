class QuizAnswersController < ApplicationController

  def create
    @quiz_answer = QuizAnswer.new(quiz_question_id: params[:quiz_question_id], answer_id: params[:answer_id])
    @quiz_answer.save
    #check if answer is correct

    #if yes increment score

  end

end
