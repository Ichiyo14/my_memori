class Question < ApplicationRecord
  belongs_to :questionnaire
  belongs_to :factor
  has_many :scales
  has_many :answer ,dependent: :destroy
end
