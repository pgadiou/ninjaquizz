class QuizAnswersController < ApplicationController

  def create
    @quiz_answer = QuizAnswer.new(quiz_answer_params)
    @answer = Answer.find(params[:value])
    @quiz_answer.answer_id = @answer.id
    @quiz_answer.save
    #check if answer is correct

    #if yes increment score


  end

  private

  def quiz_answer_params
    params.require(:quiz_answer).permit(:quiz_question_id)
  end

end
