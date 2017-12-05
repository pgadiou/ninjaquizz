class Question < ApplicationRecord
  belongs_to :type
  belongs_to :category
end
