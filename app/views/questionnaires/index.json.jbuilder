# frozen_string_literal: true

json.array! @questionnaires, partial: 'questionnaires/questionnaire', as: :questionnaire
