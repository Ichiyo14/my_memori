class Question < ApplicationRecord
  belongs_to :questionnaire
  belongs_to :factor
  has_many :scales
end
