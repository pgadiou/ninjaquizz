class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

 # def new
 #    @round = Round.new
 #    authorize @round
 #  end

 #  def create
 #    @round = Round.new(quiz_params)
 #    authorize @round
 #    if @round.save
 #      redirect_to quiz_path(@round)
 #    else
 #      render :new
 #    end
 #  end


  def update
  #   authorize @question
    if @question.update(question_params)
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

  def question_params
    params.require(:question).permit(:content)
  end

  def set_question
    @question = Question.find(params[:id])
  end


end
