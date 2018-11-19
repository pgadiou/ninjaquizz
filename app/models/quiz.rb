class Quiz < ApplicationRecord
  belongs_to :admin
  has_many :rounds, dependent: :destroy
  has_many :users, dependent: :destroy
end
