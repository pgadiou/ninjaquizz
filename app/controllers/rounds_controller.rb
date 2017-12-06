class RoundsController < ApplicationController

  def show
    @round = Round.find(params[:id])
    @first_question = QuizQuestion.where(round_id: @round.id).first
    @next_round = Round.find(params[:id].to_i + 1)
  end

end
