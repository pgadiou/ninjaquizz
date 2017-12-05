class QuizQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :round
  has_many :questions, dependent: :destroy
end
