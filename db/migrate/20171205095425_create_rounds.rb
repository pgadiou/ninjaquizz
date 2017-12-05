class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.integer :no_of_questions
      t.string :difficulty
      t.references :quiz, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
