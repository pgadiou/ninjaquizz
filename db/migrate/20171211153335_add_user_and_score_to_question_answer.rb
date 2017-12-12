class AddUserAndScoreToQuestionAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :quiz_answers, :points, :integer, default: 0
    add_reference :quiz_answers, :users, index: true, foreign_key: true
  end
end
