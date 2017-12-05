class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :total_score
      t.integer :average_time
      t.integer :ranking
      t.integer :no_correct_answers

      t.timestamps
    end
  end
end
