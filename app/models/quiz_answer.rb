class QuizAnswer < ApplicationRecord
  belongs_to :quiz_question
  belongs_to :answer
end
