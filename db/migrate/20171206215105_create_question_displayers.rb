class CreateQuestionDisplayers < ActiveRecord::Migration[5.1]
  def change
    create_table :question_displayers do |t|
      t.references :quiz_question, foreign_key: true
      t.timestamps
    end
  end
end
