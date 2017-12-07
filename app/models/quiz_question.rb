class QuizQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :round
  has_one :question_displayer, dependent: :destroy
end
