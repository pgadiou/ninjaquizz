class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :quiz, optional: :true
  has_many :quizzes, dependent: :destroy
  has_many :quiz_answers, dependent: :destroy
  has_many :result_scores, dependent: :destroy
end
