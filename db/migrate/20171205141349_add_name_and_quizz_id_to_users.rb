class AddNameAndQuizzIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_reference :users, :quiz, foreign_key: true, index: true
  end
end
