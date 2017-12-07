class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :total_score, :integer
    add_column :users, :average_time, :time
    add_column :users, :ranking, :integer
    add_column :users, :no_correct_answers, :integer
    add_column :users, :pin_number, :integer
  end
end
