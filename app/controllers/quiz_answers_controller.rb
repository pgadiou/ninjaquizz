class QuizAnswersController < ApplicationController

  def create
    @quiz_answer = QuizAnswer.new(quiz_question_id: params[:quiz_question_id], answer_id: params[:answer_id])
    @quiz_answer.save


    @start = params[:start]
    @time_to_answer = @quiz_answer.created_at.to_time - @start.to_time
    if !current_user.admin?
      if @quiz_answer.answer.is_correct?
        @score_question = (100 + (1 - @time_to_answer / 30) * 100)
      else
        @score_question = 0
      end
    end

    @round = @quiz_answer.quiz_question.round

    if ResultScore.where(:user_id == current_user.id).where(:round_id == @round).nil?
      result = ResultScore.new(user_id: current_user.id, average_time_round: @time_to_answer, round_score: @score_question, round_id: @round)
      result.save
    else
      result = ResultScore.where(:user_id == current_user.id).where(:round_id == @round)
      result.average_time_round += @time_to_answer
      result.round_score += @score_question
    end

  end
end
