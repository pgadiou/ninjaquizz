class Answer < ApplicationRecord
  belongs_to :question
  attr_accessor :question_position, :question_round_id
end
