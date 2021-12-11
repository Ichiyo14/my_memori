# frozen_string_literal: true

class Factor < ApplicationRecord
  belongs_to :questionnaire
  has_many :questions, dependent: :nullify
end
