class RemoveQuestionIdInQuizAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_column :quiz_answers, :question_id
  end
end
