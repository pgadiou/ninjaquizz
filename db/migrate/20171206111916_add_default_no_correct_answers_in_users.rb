class AddDefaultNoCorrectAnswersInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :no_correct_answers, 0
  end
end
