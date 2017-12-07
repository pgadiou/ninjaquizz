class AddDefault2ToTotalScoreInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :total_score, 0
  end
end
