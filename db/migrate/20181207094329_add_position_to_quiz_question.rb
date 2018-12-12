class AddPositionToQuizQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :quiz_questions, :position, :bigint
  end
end
