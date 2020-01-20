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

ActiveRecord::Schema.define(version: 2020_01_18_152256) do

  create_table "answers", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "game_rooms", force: :cascade do |t|
    t.string "code"
    t.boolean "active", default: true
  end

  create_table "question_themes", force: :cascade do |t|
    t.string "name"
  end

  create_table "questions", force: :cascade do |t|
    t.string "name"
    t.integer "question_type"
    t.integer "question_theme_id"
    t.index ["question_theme_id"], name: "index_questions_on_question_theme_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.string "name"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_user_answers_on_question_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "icon"
    t.integer "game_room_id"
    t.index ["game_room_id"], name: "index_users_on_game_room_id"
  end

end
