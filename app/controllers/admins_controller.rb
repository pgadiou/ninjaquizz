class AdminsController < ApplicationController
  def show
    @admin = Admin.where(params[:admin_id])
    @admin_quizzes = Quiz.where(admin: @admin)
  end

end
