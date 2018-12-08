class QuizQuestionsController < ApplicationController
  before_action :set_quiz_question, :set_user, only: [:show, :show_question, :show_answers, :show_correct_answer]

  def show
    broadcast_before_question
  end

  def create
    @quiz_question = QuizQuestion.new(quiz_question_params)
    @quiz_question.position = quiz_question_params[:position]
    if @quiz_question.save
      respond_to do |format|
        format.html { redirect_to request.referer }
        format.js
      end
    else
      render :edit
    end
  end

  def show_question
    broadcast_show_question
  end

  def show_answers
    @quiz_answer = QuizAnswer.new
    @start = Time.now
    broadcast_show_answers
  end

  def show_correct_answer
    broadcast_show_correct_answer
  end

  def show_wait_room
    broadcast_wait_room
  end

  private

  def quiz_question_params
    params.require(:quiz_question).permit(:round_id, :question_id, :position)
  end

  def set_quiz_question
    @quiz_question = QuizQuestion.find(params[:id])
    unless @quiz_question == @quiz_question.round.quiz_questions.last
      @next_quiz_question = QuizQuestion.find(params[:id].to_i + 1)
    end
    @answers = @quiz_question.question.answers
    @quiz = @quiz_question.round.quiz
    @language = @quiz.language
    @timer = @quiz.timer
  end

  def set_user
    current_user == nil ? @current_user_id = nil : @current_user_id = current_user.id
  end

  def broadcast_before_question
      ActionCable.server.broadcast("quiz_room_#{@quiz_question.round.quiz_id}", {
        admin_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_admin_before_question",
          locals: {quiz_question: @quiz_question, answers: @answers, next_quiz_question: @next_quiz_question, language: @language}),
        player_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_player_before_question",
          locals: {language: @language}),
        current_admin_id: current_admin.id,
        })
  end

  def broadcast_show_question
      ActionCable.server.broadcast("quiz_room_#{@quiz_question.round.quiz_id}", {
        admin_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_admin_before_answers",
          locals: {quiz_question: @quiz_question, answers: @answers, language: @language}),
        player_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_player_before_answers",
          locals: {language: @language}),
        current_admin_id: current_admin.id, language: @language
        })
  end

  def broadcast_show_answers
    ActionCable.server.broadcast("quiz_room_#{@quiz_question.round.quiz_id}", {
      admin_partial: ApplicationController.renderer.render(
        partial: "quiz_questions/quiz_question_admin_before_correct_answer",
        locals: {quiz_question: @quiz_question, answers: @answers, number_of_player_answers:0, language: @language}),
      player_partial: ApplicationController.renderer.render(
        partial: "quiz_questions/quiz_question_player_before_correct_answer",
        locals: {quiz_answer: @quiz_answer, quiz_question: @quiz_question, answers: @answers, start: @start, language: @language}),
      current_admin_id: current_admin.id,
    })

    if @quiz.timer == false

      @quiz.users.each do |user|
          ActionCable.server.broadcast("player_quiz_room_#{user.id}", {
            event: "answer_display_player",
            timer: false,
            player_partial: ApplicationController.renderer.render(
              partial: "quiz_questions/quiz_question_player_before_correct_answer",
              locals: {quiz_answer: @quiz_answer, quiz_question: @quiz_question, answers: @answers, start: @start, language: @language}),
            player_partial_avatar_still: ApplicationController.renderer.render(
              partial: "quiz_questions/quiz_question_player_avatar_still",
              locals: {user: user, language: @language}),
            current_admin_id: current_admin.id,
              })
      end

    else

      @quiz.users.each do |user|
          ActionCable.server.broadcast("player_quiz_room_#{user.id}", {
            event: "answer_display_player",
            timer: true,
            player_partial: ApplicationController.renderer.render(
              partial: "quiz_questions/quiz_question_player_before_correct_answer",
              locals: {quiz_answer: @quiz_answer, quiz_question: @quiz_question, answers: @answers, start: @start, language: @language}),
            player_partial_time_up: ApplicationController.renderer.render(
              partial: "quiz_questions/quiz_question_player_time_up"),
            player_partial_avatar_countdown: ApplicationController.renderer.render(
              partial: "quiz_questions/quiz_question_player_avatar_countdown",
              locals: {user: user, language: @language}),
            player_partial_avatar_still: ApplicationController.renderer.render(
              partial: "quiz_questions/quiz_question_player_avatar_still",
              locals: {user: user, language: @language}),
            current_admin_id: current_admin.id,
              })
      end
    end

  end

  def broadcast_show_correct_answer
    ActionCable.server.broadcast("quiz_room_#{@quiz_question.round.quiz_id}", {
      admin_partial: ApplicationController.renderer.render(
        partial: "quiz_questions/quiz_question_admin_after_correct_answer",
        locals: {quiz_question: @quiz_question, answers: @answers, next_quiz_question: @next_quiz_question, language: @language}),
      current_admin_id: current_admin.id,
        })

    @quiz.users.each do |user|
        ActionCable.server.broadcast("player_quiz_room_#{user.id}", {
          event: "question_answer",
          timer: @timer,
          player_partial: ApplicationController.renderer.render(
            partial: "quiz_questions/quiz_question_player_after_correct_answer",
            locals: {quiz_answer: QuizAnswer.where(quiz_question_id: @quiz_question.id, user_id: user.id).last, quiz_question: @quiz_question, user: user, language: @language}),
          current_admin_id: current_admin.id,
            })
    end
  end
end
