# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171205111000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.boolean "is_correct"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "total_score"
    t.integer "average_time"
    t.integer "ranking"
    t.integer "no_correct_answers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pin_number"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.bigint "type_id"
    t.bigint "category_id"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_questions_on_category_id"
    t.index ["type_id"], name: "index_questions_on_type_id"
  end

  create_table "quiz_answers", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_quiz_answers_on_answer_id"
    t.index ["question_id"], name: "index_quiz_answers_on_question_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.integer "no_of_rounds"
    t.string "difficulty"
    t.integer "time_per_question"
    t.integer "pin_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "result_scores", force: :cascade do |t|
    t.integer "round_score"
    t.integer "average_time_round"
    t.integer "ranking"
    t.integer "no_correct_answers"
    t.bigint "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_result_scores_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "no_of_questions"
    t.string "difficulty"
    t.bigint "quiz_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_rounds_on_category_id"
    t.index ["quiz_id"], name: "index_rounds_on_quiz_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "questions", "categories"
  add_foreign_key "questions", "types"
  add_foreign_key "quiz_answers", "answers"
  add_foreign_key "quiz_answers", "questions"
  add_foreign_key "quizzes", "users"
  add_foreign_key "result_scores", "rounds"
  add_foreign_key "rounds", "categories"
  add_foreign_key "rounds", "quizzes"
end
