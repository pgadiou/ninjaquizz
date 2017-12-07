class AddDefaultToRoundScoreInResultScores < ActiveRecord::Migration[5.1]
  def change
    change_column_default :result_scores, :round_score, 0
  end
end
