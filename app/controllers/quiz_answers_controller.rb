class QuizAnswersController < ApplicationController

  def create
    @quiz_answer = QuizAnswer.new(quiz_question_id: params[:quiz_question_id].to_i, answer_id: params[:answer_id].to_i)
    @quiz_answer.save

    #RESULT_SCORES
    #round_score
    @start = params[:start]
    @time_to_answer = @quiz_answer.created_at.to_time - @start.to_time
    if @quiz_answer.answer.is_correct?
      @score_question = 100 + (1 - @time_to_answer / 30).round(2) * 100
    else
      @score_question = 0
    end

    @round = @quiz_answer.quiz_question.round

    if ResultScore.where(user_id: current_user.id, round_id: @round.id).empty?
      @result = ResultScore.new(user_id: current_user.id, time_to_answer: @time_to_answer, round_score: @score_question, round_id: @round.id)
      @result.save
    else
      @result = ResultScore.find_by(user_id: current_user.id, round_id: @round.id)
      @result.round_score += @score_question
      @result.time_to_answer += @time_to_answer
      @result.save
    end

    # USERS
    #total_score
    current_user.total_score += @score_question
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
