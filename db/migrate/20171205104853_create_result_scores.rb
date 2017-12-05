class CreateResultScores < ActiveRecord::Migration[5.1]
  def change
    create_table :result_scores do |t|
      t.integer :round_score
      t.integer :average_time_round
      t.integer :ranking
      t.integer :no_correct_answers
      t.references :round, foreign_key: true

      t.timestamps
    end
  end
end
