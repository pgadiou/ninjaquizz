class Quiz < ApplicationRecord
  belongs_to :user
  has_many :rounds, dependent: :destroy
end
