class AddDefaultValueToQuestionAndRoundCounts < ActiveRecord::Migration[5.1]
  def change
    change_column_default :rounds, :question_count, 0
    change_column_default :quizzes, :round_count, 0
  end
end
