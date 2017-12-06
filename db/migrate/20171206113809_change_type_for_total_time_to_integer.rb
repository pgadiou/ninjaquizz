class ChangeTypeForTotalTimeToInteger < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :total_time
    add_column :users, :total_time, :integer, default: 0
  end
end
