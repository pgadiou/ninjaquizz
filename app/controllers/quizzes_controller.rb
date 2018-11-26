class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :show_results]

 # def new
 #    @quiz = Quiz.new
 #    authorize @quiz
 #  end

 #  def create
 #    @quiz = Quiz.new(quiz_params)
 #    @quiz.admin_id = current_admin.id
 #    authorize @quiz
 #    if @quiz.save
 #      redirect_to quiz_path(@quiz)
 #    else
 #      render :new
 #    end
 #  end

  def show
    @first_round = @rounds.first
  end

  def show_results
    @users_ranked = User.where(quiz_id: @quiz.id).order(total_score: :desc, total_time: :desc)
    @speedster = User.where(quiz_id: @quiz.id).order(total_time: :desc).first
    @slowster = User.where(quiz_id: @quiz.id).order(total_time: :desc).last
    @loser = User.where(quiz_id: @quiz.id).order(total_score: :desc).last
    @language = @quiz.language
    broadcast_total_results
    @quiz.users.each do |user|
      sign_out user
      user.destroy
    end
    @quiz.users.destroy_all
  end

  def edit
    @new_round = Round.new
    @new_question = Question.new
  end

  # def edit
  #     authorize @quiz
  # end

  def update
  #   authorize @quiz
    if @quiz.update(quiz_params)
      redirect_to edit_quiz_path(@quiz)
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

  def quiz_params
    params.require(:quiz).permit(:name, :language, :timer, :time_bonus)
  end

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
        locals: {users_ranked: @users_ranked, language: @language, speedster: @speedster, slowster: @slowster, loser: @loser}),
        current_user_id: current_user.id
    })

    @quiz.users.each do |user|
        ActionCable.server.broadcast("player_quiz_room_#{user.id}", {
          event: "player_results",
          player_partial: ApplicationController.renderer.render(
            partial: "quizzes/player_results",
            locals: {users_ranked: @users_ranked, player_ranking: @users_ranked.index(user), user_points: user.total_score, language: @language}),
          current_user_id: current_user.id,
        })
    end
  end

end
