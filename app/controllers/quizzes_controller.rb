class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :show_results]

 # def new
 #    @service = Service.new
 #    authorize @service
 #  end

 #  def create
 #    @service = Service.new(service_params)
 #    @service.user_id = current_user.id
 #    authorize @service
 #    if @service.save
 #      redirect_to service_path(@service)
 #    else
 #      render :new
 #    end
 #  end

  def show
    @quiz = Quiz.find(params[:id])
    @first_round = Round.where(quiz_id: @quiz.id).first
  end

  def show_results
    @users_ranked = User.where(quiz_id: @quiz.id).order(total_score: :desc).limit(3)
    broadcast_total_results
    @quiz.users.each do |user|
      sign_out user
      user.destroy
    end
    @quiz.users.destroy_all
  end


  # def edit
  #     authorize @service
  # end

  # def update
  #   authorize @service
  #   if @service.update(service_params)
  #     redirect_to service_path(@service)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   authorize @service
  #   @service.destroy
  #   redirect_to new_service_path
  # end

private

  def set_quiz
    @quiz = Quiz.find(params[:id])
    @rounds = Round.where(quiz_id: @quiz.id)
    @quiz_questions = []
    @rounds.each do |round|
      @quiz_questions << QuizQuestion.where(round_id: round.id)
    end
  end

  def broadcast_total_results
    ActionCable.server.broadcast("quiz_room_#{@quiz.id}", {
      admin_partial: ApplicationController.renderer.render(
        partial: "quizzes/admin_results",
        locals: {users_ranked: @users_ranked}),
        current_user_id: current_user.id,
    })

    @quiz.users.each do |user|
      unless user == @quiz.user
        ActionCable.server.broadcast("player_quiz_room_#{user.id}", {
          event: "player_results",
          player_partial: ApplicationController.renderer.render(
            partial: "quizzes/player_results",
            locals: {player_ranking: @users_ranked.index(user), user_points: user.total_score}),
          current_user_id: current_user.id,
        })
      end
    end
  end

end
