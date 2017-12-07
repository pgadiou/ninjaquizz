class AddQuestionCountToRound < ActiveRecord::Migration[5.1]
  def change
    add_column :rounds, :question_count, :integer
  end
end
