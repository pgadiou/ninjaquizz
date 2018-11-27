class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  require 'open-uri'
  require 'json'

 # def new
 #    @round = Round.new
 #    authorize @round
 #  end

  def create
    # authorize @round
    if question_params[:question_type] == "Random"
      url = 'https://opentdb.com/api.php?amount=1&type=multiple'
      question_serialized = open(url).read
      question = JSON.parse(question_serialized)
      @question = Question.new(
      category_id: question_params[:category_id],
      type_id: Type.all.last.id,
      content: question["results"][0]["question"]
      )
      @question.save
      @answers = []
      @new_correct_answer = Answer.new(
        content: question["results"][0]["correct_answer"],
        is_correct: true,
        question: @question
      )
      @answers << @new_correct_answer
      i = 0
      question["results"][0]["incorrect_answers"].each do |wrong_answer|
        new_wrong_answer = Answer.new(
          content: wrong_answer,
          question: @question
          )
        @answers << new_wrong_answer
        i+=1
      end
      @question_position = question_params[:position]
      @question_round_id = question_params[:round_id]
      @display_form = false
      if @answers.shuffle.each(&:save)
        respond_to do |format|
          format.html { redirect_to request.referer }
          format.js
        end
      else
        render :edit
      end
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
    #deleted .require(:question) to allow the newly created question partial to generate a question through a button
    params.require(:question).permit(:content, :category_id, :question_type, :round_id, :position)
  end

  def set_question
    @question = Question.find(params[:id])
  end


end
