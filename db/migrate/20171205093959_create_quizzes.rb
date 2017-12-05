class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.string :status
      t.integer :no_of_rounds
      t.string :difficulty
      t.integer :time_per_question
      t.integer :pin_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
