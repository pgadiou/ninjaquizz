class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :content
      t.references :type, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
