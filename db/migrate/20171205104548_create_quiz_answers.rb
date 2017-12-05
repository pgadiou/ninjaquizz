class CreateQuizAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_answers do |t|
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
