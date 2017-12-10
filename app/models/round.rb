class Round < ApplicationRecord
  belongs_to :quiz
  belongs_to :category
  has_many :quiz_questions, dependent: :destroy
  has_many :result_scores, dependent: :destroy
end
