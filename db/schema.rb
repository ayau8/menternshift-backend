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

ActiveRecord::Schema[7.0].define(version: 2023_12_10_065850) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiences", force: :cascade do |t|
    t.string "company"
    t.string "job_title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.bigint "mentor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentor_id"], name: "index_experiences_on_mentor_id"
  end

  create_table "expertises", force: :cascade do |t|
    t.string "domain"
    t.integer "years_of_experiences"
    t.bigint "mentee_id", null: false
    t.bigint "mentor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentee_id"], name: "index_expertises_on_mentee_id"
    t.index ["mentor_id"], name: "index_expertises_on_mentor_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.bigint "mentee_id", null: false
    t.bigint "mentor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentee_id"], name: "index_languages_on_mentee_id"
    t.index ["mentor_id"], name: "index_languages_on_mentor_id"
  end

  create_table "mentees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "location"
    t.string "company"
    t.string "job_title"
    t.text "profile_img"
    t.text "introduction"
    t.text "linkedin_url"
    t.text "behance_url"
    t.text "instagram_url"
    t.text "portfolio_url"
    t.text "resume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "location"
    t.text "profile_img"
    t.text "introduction"
    t.string "guidance_from"
    t.text "linkedin_url"
    t.text "behance_url"
    t.text "instagram_url"
    t.text "portfolio_url"
    t.text "resume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentorships", force: :cascade do |t|
    t.bigint "mentee_id", null: false
    t.bigint "mentor_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentee_id"], name: "index_mentorships_on_mentee_id"
    t.index ["mentor_id"], name: "index_mentorships_on_mentor_id"
    t.index ["project_id"], name: "index_mentorships_on_project_id"
  end

  create_table "project_skills", force: :cascade do |t|
    t.string "name"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_skills_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "image_url"
    t.date "starting_date"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_skills", force: :cascade do |t|
    t.string "name"
    t.bigint "mentee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentee_id"], name: "index_user_skills_on_mentee_id"
  end

  add_foreign_key "experiences", "mentors"
  add_foreign_key "expertises", "mentees"
  add_foreign_key "expertises", "mentors"
  add_foreign_key "languages", "mentees"
  add_foreign_key "languages", "mentors"
  add_foreign_key "mentorships", "mentees"
  add_foreign_key "mentorships", "mentors"
  add_foreign_key "mentorships", "projects"
  add_foreign_key "project_skills", "projects"
  add_foreign_key "user_skills", "mentees"
end
