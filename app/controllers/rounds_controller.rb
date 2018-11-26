class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy, :show_round_results]

 # def new
 #    @round = Round.new
 #    authorize @round
 #  end

 def create
  @round = Round.new(round_params)
 #    authorize @round
  if @round.save
    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js
    end
  else
    render :new
  end
 end

  def show
    @language = @quiz.language
    @round_number = Round.where(quiz_id: @quiz.id).index(@round) + 1
    @category = @round.category.name
    @first_question = QuizQuestion.where(round_id: @round.id).first
    current_user == nil ? nil : @current_user_id = current_user.id
    broadcast_round
  end

  def show_round_results
    @language = @quiz.language
    @users_ranked = User.where(quiz_id: @quiz.id).order(total_score: :desc).limit(3)
    @speedster = User.where(quiz_id: @quiz.id).order(total_time: :desc).first
    @slowster = User.where(quiz_id: @quiz.id).order(total_time: :desc).last
    @loser = User.where(quiz_id: @quiz.id).order(total_score: :desc).last
    @next_round_index = Round.where(quiz_id: @quiz.id).index(@round) + 1
    @next_round = Round.where(quiz_id: @quiz.id)[@next_round_index]
    broadcast_round_results
  end

  def update
  #   authorize @quiz
    if @round.update(round_params)
      respond_to do |format|
        format.html { redirect_to request.referer }
        format.js
      end
    else
    render :edit
    end
  end

  # def destroy
  #   authorize @quiz
  #   @quiz.destroy
  #   redirect_to new_quiz_path
  # end


private

  def round_params
    params.require(:round).permit(:category_id, :no_of_questions, :quiz_id)
  end

  def set_round
    @round = Round.find(params[:id])
    @quiz = @round.quiz
  end

  def broadcast_round
    ActionCable.server.broadcast("quiz_room_#{@round.quiz_id}", {
      admin_partial: ApplicationController.renderer.render(
        partial: "rounds/round_admin",
        locals: {round: @round, first_question: @first_question, round_number: @round_number, category: @category}),
      player_partial: ApplicationController.renderer.render(
        partial: "rounds/round_player",
        locals: {round: @round, first_question: @first_question}),
      current_user_id: @current_user_id,
    })
  end

  def broadcast_round_results
    ActionCable.server.broadcast("quiz_room_#{@round.quiz_id}", {
      admin_partial: ApplicationController.renderer.render(
        partial: "rounds/round_admin_results",
        locals: {next_round: @next_round, users_ranked: @users_ranked, speedster: @speedster, slowster: @slowster, loser: @loser, language: @language}),
        current_user_id: @current_user_id,
    })

    @quiz.users.each do |user|
        ActionCable.server.broadcast("player_quiz_room_#{user.id}", {
          event: "player_results",
          player_partial: ApplicationController.renderer.render(
            partial: "rounds/round_player_results",
            locals: {player_ranking: @users_ranked.index(user), user_points: user.total_score}),
          current_user_id: @current_user_id,
        })
    end
  end


end
