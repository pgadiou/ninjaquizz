class AddRoundCountToQuiz < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :round_count, :integer
  end
end
