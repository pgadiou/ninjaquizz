class Question < ApplicationRecord
  belongs_to :type
  belongs_to :category
  has_many :quiz_questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  attr_accessor :question_type, :position, :round_id
end
