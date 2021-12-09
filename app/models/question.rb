class Question < ApplicationRecord
  belongs_to :questionnaire
  belongs_to :factor
end
