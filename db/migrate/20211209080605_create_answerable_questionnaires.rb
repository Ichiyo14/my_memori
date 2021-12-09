class CreateAnswerableQuestionnaires < ActiveRecord::Migration[6.1]
  def change
    create_table :answerable_questionnaires do |t|
      t.references :user, null: false, foreign_key: true
      t.references :questionnaire, null: false, foreign_key: true
    end
  end
end
