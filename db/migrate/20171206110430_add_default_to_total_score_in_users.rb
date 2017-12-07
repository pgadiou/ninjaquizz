class AddDefaultToTotalScoreInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :total_score, default: 0
  end
end
