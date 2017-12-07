class AddDefaultToTimeToAnswerInResultScores < ActiveRecord::Migration[5.1]
  def change
    change_column_default :result_scores, :time_to_answer, 0
  end
end
