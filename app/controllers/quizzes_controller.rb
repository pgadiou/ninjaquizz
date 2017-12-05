class QuizzesController < ApplicationController

  skip_before_action :authenticate_user!, only: :show
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

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

end
