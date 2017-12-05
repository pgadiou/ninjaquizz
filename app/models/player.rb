class Player < ApplicationRecord
  has_many :result_score, dependent: :destroy;
end
