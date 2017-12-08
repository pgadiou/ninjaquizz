class Quiz < ApplicationRecord
  belongs_to :user
  has_many :rounds, dependent: :destroy
  has_many :users, dependent: :destroy
end
