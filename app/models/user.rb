# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questionnaires, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :answerable_questionnaires, dependent: :destroy
end
