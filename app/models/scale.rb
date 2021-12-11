# frozen_string_literal: true

class Scale < ApplicationRecord
  belongs_to :question
  has_many :answers, dependent: :destroy
end
