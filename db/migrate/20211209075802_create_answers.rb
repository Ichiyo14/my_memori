class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :scale, null: false, foreign_key: true
      t.integer :time,null:false

      t.timestamps
    end
  end
end
