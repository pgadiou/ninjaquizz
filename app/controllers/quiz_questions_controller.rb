class QuizQuestionsController < ApplicationController

  def show
    @quiz_question = QuizQuestion.find(params[:id])
    @answers = @quiz_question.question.answers
    @quiz_answer = QuizAnswer.new
    @start = Time.now
  end

end
