class AnswerableQuestionnaire < ApplicationRecord
  belongs_to :user
  belongs_to :questionnaire
end
