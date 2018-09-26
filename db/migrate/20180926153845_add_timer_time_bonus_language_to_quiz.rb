class AddTimerTimeBonusLanguageToQuiz < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :language, :string, default: "english"
    add_column :quizzes, :time_bonus, :boolean, default: true
    add_column :quizzes, :timer, :boolean, default: false
  end
end
