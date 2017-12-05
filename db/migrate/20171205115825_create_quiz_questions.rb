class CreateQuizQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_questions do |t|
      t.references :question, foreign_key: true
      t.references :round, foreign_key: true

      t.timestamps
    end
  end
end
