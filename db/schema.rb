# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140412144217) do

  create_table "amount_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: true do |t|
    t.string   "name"
    t.string   "part"
    t.text     "description"
    t.text     "description_fa"
    t.integer  "level"
    t.integer  "equipment_id"
    t.integer  "days_per_week"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "exercises", ["equipment_id"], name: "index_exercises_on_equipment_id", using: :btree

  create_table "exercises_workout_plan", id: false, force: true do |t|
    t.integer "workout_plan_id"
    t.integer "exercise_id"
  end

  add_index "exercises_workout_plan", ["workout_plan_id", "exercise_id"], name: "index_exercises_workout_plan_on_workout_plan_id_and_exercise_id", using: :btree

  create_table "foods", force: true do |t|
    t.string   "name"
    t.integer  "calory"
    t.float    "protein"
    t.float    "carbohydrate"
    t.float    "fat"
    t.integer  "amount_type_id"
    t.float    "per"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "foods", ["amount_type_id"], name: "index_foods_on_amount_type_id", using: :btree

  create_table "foods_plans", id: false, force: true do |t|
    t.integer "plan_id"
    t.integer "food_id"
  end

  add_index "foods_plans", ["plan_id", "food_id"], name: "index_foods_plans_on_plan_id_and_food_id", using: :btree

  create_table "plans", force: true do |t|
    t.integer  "total_cal"
    t.float    "total_protein"
    t.float    "total_carbohydrate"
    t.float    "total_fat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birthdate"
    t.integer  "height"
    t.integer  "weight"
    t.string   "country"
    t.string   "city"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "language"
  end

  create_table "taking_food_plans", force: true do |t|
    t.integer  "plan_id"
    t.integer  "profile_id"
    t.string   "summary"
    t.date     "start_time"
    t.date     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taking_food_plans", ["plan_id", "profile_id"], name: "index_taking_food_plans_on_plan_id_and_profile_id", using: :btree

  create_table "users", force: true do |t|
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profile_id"], name: "index_users_on_profile_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workout_plans", force: true do |t|
    t.string   "name"
    t.string   "difficulty"
    t.string   "part"
    t.string   "mode"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "duration"
  end

  create_table "workouts", force: true do |t|
    t.integer  "user_id"
    t.integer  "workout_plan_id"
    t.date     "date"
    t.time     "total_min"
    t.integer  "total_cal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id", using: :btree
  add_index "workouts", ["workout_plan_id"], name: "index_workouts_on_workout_plan_id", using: :btree

end
