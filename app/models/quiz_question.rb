class QuizQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :round
  has_many :quiz_answers, dependent: :destroy
  attr_accessor :position
end
