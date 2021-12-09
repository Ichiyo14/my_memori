class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :questionnaire, null: false, foreign_key: true
      t.references :factor, null: false, foreign_key: true
      t.text :content,null:false
      t.integer :order, null:false
    end
  end
end
