class QuizQuestionsController < ApplicationController
  before_action :set_quiz_question, only: [:show, :show_question, :show_answers, :show_correct_answer]

  def show
    broadcast_before_question
    @quiz_question.round.question_count += 1
  end

  def show_question
    broadcast_show_question
  end

  def show_answers
    @quiz_answer = QuizAnswer.new
    broadcast_show_answers
  end

  def show_correct_answer
    @quiz_answer = QuizAnswer.new
    broadcast_show_correct_answer
  end

  private

  def set_quiz_question
    @quiz_question = QuizQuestion.find(params[:id])
    @answers = @quiz_question.question.answers
    @next_quiz_question = QuizQuestion.find(params[:id].to_i + 1)
  end

  def broadcast_before_question
      ActionCable.server.broadcast("quiz_room_#{@quiz_question.round.quiz_id}", {
        admin_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_admin_before_question",
          locals: {quiz_question: @quiz_question, answers: @answers, next_quiz_question: @next_quiz_question}),
        player_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_player_before_question"),
        current_user_id: current_user.id,
        })
  end

  def broadcast_show_question
      ActionCable.server.broadcast("quiz_room_#{@quiz_question.round.quiz_id}", {
        admin_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_admin_before_answers",
          locals: {quiz_question: @quiz_question, answers: @answers, next_quiz_question: @next_quiz_question}),
        player_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_player_before_answers"),
        current_user_id: current_user.id,
        })
  end

  def broadcast_show_answers
      ActionCable.server.broadcast("quiz_room_#{@quiz_question.round.quiz_id}", {
        admin_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_admin_before_correct_answer",
          locals: {quiz_question: @quiz_question, answers: @answers, next_quiz_question: @next_quiz_question}),
        player_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_player_before_correct_answer",
          locals: {quiz_answer: @quiz_answer, quiz_question: @quiz_question, answers: @answers}),
        current_user_id: current_user.id,
        })
  end

    def broadcast_show_correct_answer
      ActionCable.server.broadcast("quiz_room_#{@quiz_question.round.quiz_id}", {
        admin_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_admin_after_correct_answer",
          locals: {quiz_question: @quiz_question, answers: @answers, next_quiz_question: @next_quiz_question}),
        player_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_player_after_correct_answer",
          locals: {quiz_answer: @quiz_answer, quiz_question: @quiz_question, answers: @answers}),
        current_user_id: current_user.id,
        })
  end

end
