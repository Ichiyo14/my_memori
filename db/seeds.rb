# frozen_string_literal: true

require 'active_record/fixtures'

ActiveRecord::FixtureSet.create_fixtures 'db/fixtures', %i[
  users
  questionnaires
  factors
  questions
  scales
  answers
  answerable_questionnaires
]
