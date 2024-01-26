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

ActiveRecord::Schema[7.0].define(version: 2024_01_17_074356) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "experiences", force: :cascade do |t|
    t.string "company"
    t.string "job_title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "expertises", force: :cascade do |t|
    t.string "domain"
    t.integer "years_of_experience"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_expertises_on_user_id"
  end

  create_table "project_areas", force: :cascade do |t|
    t.string "design"
    t.string "frontend"
    t.string "backend"
    t.string "devops"
    t.string "qa"
    t.string "project_manager"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_areas_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "image_url"
    t.date "start_date"
    t.date "end_date"
    t.integer "duration"
    t.string "progress"
    t.text "skills", default: [], array: true
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.text "comment"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "username"
    t.string "location"
    t.string "company"
    t.string "job_title"
    t.text "profile_img"
    t.text "bio"
    t.text "guidances", default: [], array: true
    t.text "languages", default: [], array: true
    t.text "skills", default: [], array: true
    t.string "is_available"
    t.string "timezone"
    t.hstore "social_platforms"
    t.bigint "project_area_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["project_area_id"], name: "index_users_on_project_area_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "experiences", "users"
  add_foreign_key "expertises", "users"
  add_foreign_key "project_areas", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "users", "project_areas"
end
