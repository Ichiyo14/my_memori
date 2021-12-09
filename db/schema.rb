ActiveRecord::Schema.define(version: 2021_12_09_013530) do

  enable_extension "plpgsql"

  create_table "questionnaires", force: :cascade do |t|
    t.text "description"
    t.bigint "user_id", null: false
    t.string "reference_url"
    t.string "tittle", null: false
    t.text "memo"
    t.text "reference_memo"
    t.float "average_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_questionnaires_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "questionnaires", "users"
end
