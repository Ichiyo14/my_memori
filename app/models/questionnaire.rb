# frozen_string_literal: true

class Questionnaire < ApplicationRecord
  belongs_to :user
  has_many :factors, dependent: :destroy
end
