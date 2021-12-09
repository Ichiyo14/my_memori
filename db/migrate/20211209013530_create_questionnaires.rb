class CreateQuestionnaires < ActiveRecord::Migration[6.1]
  def change
    create_table :questionnaires do |t|
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :reference_url
      t.string :tittle, null: false
      t.text :memo
      t.text :reference_memo
      t.float :average_score

      t.timestamps
    end
  end
end
