class CreateFactors < ActiveRecord::Migration[6.1]
  def change
    create_table :factors do |t|
      t.float :average_score
      t.string :name, null: false
      t.integer :order, null: false
      t.references :questionnaire, null: false, foreign_key: true
    end
  end
end
