class QuizQuestionsController < ApplicationController

  def show
    @quiz_question = QuizQuestion.find(params[:id])
    @answers = @quiz_question.question.answers
    @quiz_answer = QuizAnswer.new
    @next_quiz_question = QuizQuestion.find(params[:id].to_i + 1)
  end

end
