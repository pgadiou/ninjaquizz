class QuizAnswersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    #create the new quizAnswer instance corresponding to the user's answer
    @quiz_answer = QuizAnswer.new(quiz_question_id: params[:quiz_question_id].to_i, answer_id: params[:answer_id].to_i, user_id: current_user.id)
    define_player_score
    @quiz_answer.save
    broadcast_number_of_player_answers
    # define_player_round_score
    update_player_overall_stats
  end

  private

  # def define_player_round_score
  #   @round = @quiz_answer.quiz_question.round

  #   #create or update ResultScore instance to record the user's score in the round
  #   if ResultScore.where(user_id: current_user.id, round_id: @round.id).empty?
  #     @result = ResultScore.new(user_id: current_user.id, time_to_answer: @time_to_answer, round_score: @quiz_answer.points, round_id: @round.id)
  #     @result.save
  #   else
  #     @result = ResultScore.find_by(user_id: current_user.id, round_id: @round.id)
  #     @result.round_score += @quiz_answer.points
  #     @result.time_to_answer += @time_to_answer
  #     @result.save
  #   end
  # end

  #question score
  def define_player_score
    @quiz_question = QuizQuestion.find(params[:quiz_question_id])
    @answers = @quiz_question.question.answers
    @quiz = @quiz_question.round.quiz
    @start = params[:start]
    @time_to_answer = @quiz_answer.created_at.to_time - @start.to_time
    #set speed bonus if the game is played with time bonus
    if @quiz.time_bonus
      if @quiz_answer.answer.is_correct
        @quiz_answer.points = 100 + (1 - @time_to_answer / 10).round(2) * 100
      end
    else
      if @quiz_answer.answer.is_correct
        @quiz_answer.points = 100
      end
    end
  end

  def update_player_overall_stats
    #total_score
    current_user.total_score += @quiz_answer.points
    #average_time need to divide by number of questions
    current_user.total_time += @time_to_answer
    #number of correct answers
    current_user.no_correct_answers += 1 if @quiz_answer.answer.is_correct?
    # save
    current_user.save
  end

  #provide admin with number of players who answered (allows to tap next when everyone is ready)
  def broadcast_number_of_player_answers
    @number_of_player_answers = QuizAnswer.where(quiz_question_id: params[:quiz_question_id]).count
    ActionCable.server.broadcast("quiz_room_#{@quiz_question.round.quiz_id}", {
      admin_partial: ApplicationController.renderer.render(
        partial: "quiz_questions/quiz_question_admin_before_correct_answer",
        locals: {quiz_question: @quiz_question, answers: @answers, number_of_player_answers: @number_of_player_answers })
    })
  end

end
