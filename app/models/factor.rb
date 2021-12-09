class Factor < ApplicationRecord
  belongs_to :questionnaire
  has_many :questions
end
