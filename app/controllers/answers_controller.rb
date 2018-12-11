class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

 # def new
 #    @answer = Answer.new
 #    authorize @answer
 #  end

  def create
    @answer = Answer.new(answer_params)
    @question = @answer.question
    # authorize @answer
    if @answer.save
      respond_to do |format|
        format.html { redirect_to request.referer }
        format.js
      end
    else
      render :edit
    end
  end


  def update
  #   authorize @answer
    if @answer.update(answer_params)
      respond_to do |format|
        format.html { redirect_to request.referer }
        format.js
      end
    else
    render :edit
    end
  end

  # def destroy
  #   authorize @answer
  #   @answer.destroy
  #   redirect_to new_answer_path
  # end


private

  def answer_params
    params.require(:answer).permit(:question_id, :content, :is_correct)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
