class DefineSingleUserToQuizAnswer < ActiveRecord::Migration[5.1]
  def change
    remove_reference :quiz_answers, :users, index: true, foreign_key: true
    add_reference :quiz_answers, :user, index: true, foreign_key: true
  end
end
