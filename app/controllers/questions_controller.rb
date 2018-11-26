class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  require 'open-uri'
  require 'json'

 # def new
 #    @round = Round.new
 #    authorize @round
 #  end

  def create
    @question = Question.new(question_params[:category_id])
    if question_params[:question_type] == "Automatic"
      url = 'https://opentdb.com/api.php?amount=50&type=multiple'
      question_serialized = open(url).read
      question = JSON.parse(question_serialized)
      @question = Question.new(
      content: questions["results"][0]["question"],
      question_params[:category_id],
      )
    # authorize @round
    if @question.save
      redirect_to quiz_path(@round)
    else
      render :new
    end
  end


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
    params.require(:question).permit(:content, :category_id, :question_type)
  end

  def set_question
    @question = Question.find(params[:id])
  end


end
