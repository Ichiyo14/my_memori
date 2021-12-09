class CreateScales < ActiveRecord::Migration[6.1]
  def change
    create_table :scales do |t|
      t.references :question, null: false, foreign_key: true
      t.integer :scale, null: false
      t.text :representation
    end
  end
end
