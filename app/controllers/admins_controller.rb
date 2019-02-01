class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy, :select_quiz]

  def show
    @admin_quizzes = Quiz.where(admin: @admin)
    unless @admin_quizzes.empty?
      if @admin.selected_quiz_id == nil
        @selected_quiz = Quiz.find(@admin_quizzes.last.id)
      else
        @selected_quiz = Quiz.find(@admin.selected_quiz_id)
      end
    end
    set_new_quiz
  end

  def select_quiz
    @selected_quiz = Quiz.find(params[:selected_quiz_id].to_i)
    @admin.selected_quiz_id = @selected_quiz.id
    if @admin.save
      respond_to do |format|
        format.html { redirect_to admin_path(@admin) }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_path(@admin) }
        format.js
      end
    end

  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def set_new_quiz
    @new_quiz = Quiz.new()
  end


  def admins_params
    params.require(:admin).permit(:quiz_id)
  end

end
