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
    @quiz = @round.quiz
    @users_ranked = User.where(quiz_id: @quiz.id).order(total_score: :desc).limit(3)
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
        current_user_id: current_user.id,
    })

    @quiz.users.each do |user|
      unless user == @quiz.user
        ActionCable.server.broadcast("player_quiz_room_#{user.id}", {
          event: "player_results",
          player_partial: ApplicationController.renderer.render(
            partial: "rounds/round_player_results",
            locals: {player_ranking: @users_ranked.index(user), user_points: user.total_score}),
          current_user_id: current_user.id,
        })
      end
    end
  end


end
