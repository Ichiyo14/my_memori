# frozen_string_literal: true

json.extract! questionnaire, :id, :description, :user_id, :reference_url, :tittle, :memo, :reference_memo, :average_score, :created_at, :updated_at
json.url questionnaire_url(questionnaire, format: :json)
