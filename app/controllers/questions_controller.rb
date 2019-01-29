class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  require 'open-uri'
  require 'json'

 # def new
 #    @question = Question.new
 #    authorize @question
 #  end

  def create
    # authorize @question
    if question_params[:question_type] == "Random"
      obtain_api_question(question_params)
      set_api_question(question_params, @question_json)
    else
      @question = Question.new(category_id: question_params[:category_id],
        type_id: Type.all.last.id,
        )
      @question_position = question_params[:position]
      @question_round_id = question_params[:round_id]
      @manual_question = true
      if @question.save
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
    question_params[:question_type] == "Manual"? @modal_active = true : @modal_active = false
    @question_position = question_params[:position]
    @question_round_id = question_params[:round_id]
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
  #   authorize @question
  #   @question.destroy
  # end


private

  #call api to obtain hash with question
  def obtain_api_question(params)
    @category = Category.find(params[:category_id])
    #obtain random category if no category provided by admin
    if @category.api_id == nil
      url = 'https://opentdb.com/api.php?amount=1&type=multiple'
    else
      url = 'https://opentdb.com/api.php?amount=1&category='+@category.api_id.to_s+'&type=multiple'
    end
    question_serialized = open(url).read
    @question_json = JSON.parse(question_serialized)
  end

  #create question based on the hash obtained through the api
  def set_api_question(params, question)
    @question = Question.new(
      category_id: params[:category_id],
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
    @question_position = params[:position]
    @question_round_id = params[:round_id]
    @manual_question = false
    if @answers.shuffle.each(&:save)
      respond_to do |format|
        format.html { redirect_to request.referer }
        format.js
      end
    else
      render :edit
    end
  end


  def question_params
    #deleted .require(:question) to allow the newly created question partial to generate a question through a button
    params.require(:question).permit(:content, :category_id, :question_type, :round_id, :position)
  end

  def set_question
    @question = Question.find(params[:id])
  end


end
