class RemoveUserKeyFromQuiz < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :quizzes, column: :user_id
    remove_column :quizzes, :user_id
  end
end
