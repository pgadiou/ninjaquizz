class RoundsController < ApplicationController

  def show
    @round = Round.find(params[:id])
    @first_question = QuizQuestion.where(round_id: @round.id).first
    broadcast_round
    # if @round.quiz.round_count < @round.quiz.no_of_rounds
    #   @next_round = Round.find(params[:id].to_i + 1)
    # end
  end

private

  def broadcast_round
    ActionCable.server.broadcast("quiz_room_#{@round.quiz_id}", {
      admin_partial: ApplicationController.renderer.render(
        partial: "rounds/round_admin",
        locals: {round: @round, first_question: @first_question}),
      player_partial: ApplicationController.renderer.render(
        partial: "rounds/round_player",
        locals: {round: @round, first_question: @first_question}),
      current_user_id: current_user.id,
      })
  end


end
