class QuestionDisplayersController < ApplicationController
  before_action :set_question_displayer, only: [:show, :edit]

  def new
    broadcast_before_answers
  end

  def show
    broadcast_before_answers
  end

  def edit
    broadcast_before_correct_answer
  end

  private

  def set_question_displayer
    @question_displayer = QuestionDisplayer.find(params[:id])
    @quiz_question = @question_displayer.quiz_question
    @answers = @quiz_question.question.answers
    @quiz_answer = QuizAnswer.new
    @next_quiz_question = QuizQuestion.find(@quiz_answer.id.to_i + 1)
  end

  def broadcast_before_answers
      ActionCable.server.broadcast("quiz_room_#{@round.quiz_id}", {
        admin_partial: ApplicationController.renderer.render(
          partial: "quiz_question/quiz_question_admin_before_answers",
          locals: {quiz_question: @quiz_question, answers: @answers, next_quiz_question: @next_quiz_question}),
        player_partial: ApplicationController.renderer.render(
          partial: "quiz_question/quiz_question_player_before_answers"),
        current_user_id: current_user.id,
        })
  end

    def broadcast_before_correct_answer
      ActionCable.server.broadcast("quiz_room_#{@round.quiz_id}", {
        admin_partial: ApplicationController.renderer.render(
          partial: "quiz_question/quiz_question_admin_before_answers",
          locals: {quiz_question: @quiz_question, answers: @answers, next_quiz_question: @next_quiz_question}),
        player_partial: ApplicationController.renderer.render(
          partial: "quiz_question/quiz_question_player_before_answers"),
        current_user_id: current_user.id,
        })
  end

    def broadcast_after_correct_answers
      ActionCable.server.broadcast("quiz_room_#{@round.quiz_id}", {
        admin_partial: ApplicationController.renderer.render(
          partial: "quiz_question/quiz_question_admin_before_answers",
          locals: {quiz_question: @quiz_question, answers: @answers, next_quiz_question: @next_quiz_question}),
        player_partial: ApplicationController.renderer.render(
          partial: "quiz_question/quiz_question_player_before_answers"),
        current_user_id: current_user.id,
        })
  end

end
