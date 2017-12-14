class QuizAnswersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create

    @quiz_answer = QuizAnswer.new(quiz_question_id: params[:quiz_question_id].to_i, answer_id: params[:answer_id].to_i, user_id: current_user.id)
    @quiz_answer.save

    #RESULT_SCORES
    #round_score
    @start = params[:start]
    @time_to_answer = @quiz_answer.created_at.to_time - @start.to_time
    if @quiz_answer.answer.is_correct
      @quiz_answer.points = 100 + (1 - @time_to_answer / 10).round(2) * 100
    end
    @quiz_answer.save

    @round = @quiz_answer.quiz_question.round

    if ResultScore.where(user_id: current_user.id, round_id: @round.id).empty?
      @result = ResultScore.new(user_id: current_user.id, time_to_answer: @time_to_answer, round_score: @quiz_answer.points, round_id: @round.id)
      @result.save
    else
      @result = ResultScore.find_by(user_id: current_user.id, round_id: @round.id)
      @result.round_score += @quiz_answer.points
      @result.time_to_answer += @time_to_answer
      @result.save
    end

    # USERS
    #total_score
    current_user.total_score += @quiz_answer.points
    #ranking
    current_user.ranking = User.all.map { |user| user.total_score }.sort { |x,y| y <=> x }.index("#{current_user.total_score}")
    #average_time need to divide by number of questions
    @number_of_questions = @round.quiz.rounds.map { |round| round.no_of_questions }.reduce(:+)
    current_user.total_time += @time_to_answer
    #number of correct answers
    current_user.no_correct_answers += 1 if @quiz_answer.answer.is_correct?
    # save
    current_user.save
  end

end
