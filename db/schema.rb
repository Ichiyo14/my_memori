# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_09_075354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "factors", force: :cascade do |t|
    t.float "average_score"
    t.string "name", null: false
    t.integer "order", null: false
    t.bigint "questionnaire_id", null: false
    t.index ["questionnaire_id"], name: "index_factors_on_questionnaire_id"
  end

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

  create_table "questions", force: :cascade do |t|
    t.bigint "questionnaire_id", null: false
    t.bigint "factor_id", null: false
    t.text "content", null: false
    t.integer "order", null: false
    t.index ["factor_id"], name: "index_questions_on_factor_id"
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "scales", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.integer "scale", null: false
    t.text "representation"
    t.index ["question_id"], name: "index_scales_on_question_id"
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

  add_foreign_key "factors", "questionnaires"
  add_foreign_key "questionnaires", "users"
  add_foreign_key "questions", "factors"
  add_foreign_key "questions", "questionnaires"
  add_foreign_key "scales", "questions"
end
