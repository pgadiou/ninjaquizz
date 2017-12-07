class AddQuizQuestionIdToQuizAnswers < ActiveRecord::Migration[5.1]
  def change
    add_reference :quiz_answers, :quiz_question, index: true, foreign_key: true
  end
end
