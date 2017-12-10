class RoundsController < ApplicationController

  def show
    @round = Round.find(params[:id])
    @first_question = QuizQuestion.where(round_id: @round.id).first
    broadcast_round
    # if @round.quiz.round_count < @round.quiz.no_of_rounds
    #   @next_round = Round.find(params[:id].to_i + 1)
    # end
  end

    def show_round_results
    @round = Round.find(params[:id])
    @users_ranked = User.where(quiz_id: @round.quiz.id).order(total_score: :desc).limit(3)
    broadcast_round_results
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

    def broadcast_round_results
    ActionCable.server.broadcast("quiz_room_#{@round.quiz_id}", {
        admin_partial: ApplicationController.renderer.render(
          partial: "rounds/round_admin_results",
          locals: {next_round: @next_round, users_ranked: @users_ranked}),
        player_partial: ApplicationController.renderer.render(
          partial: "rounds/round_player_results"),
        current_user_id: current_user.id,
        })
  end


end
