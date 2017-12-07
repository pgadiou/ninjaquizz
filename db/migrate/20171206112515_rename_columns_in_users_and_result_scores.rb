class RenameColumnsInUsersAndResultScores < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :average_time, :total_time
    rename_column :result_scores, :average_time_round, :time_to_answer
  end
end
