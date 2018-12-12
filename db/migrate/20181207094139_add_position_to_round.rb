class AddPositionToRound < ActiveRecord::Migration[5.1]
  def change
    add_column :rounds, :position, :bigint
  end
end
