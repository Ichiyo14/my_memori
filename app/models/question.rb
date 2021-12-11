# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :questionnaire
  belongs_to :factor
  has_many :scales, dependent: :destroy
  has_many :answer, dependent: :destroy
end
