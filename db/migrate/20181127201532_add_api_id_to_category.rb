class AddApiIdToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :api_id, :bigint
  end
end
