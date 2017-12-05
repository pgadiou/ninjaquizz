class AddColumnPinToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :pin_number, :integer
  end
end
