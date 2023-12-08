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

ActiveRecord::Schema[7.0].define(version: 2023_12_08_053240) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mentees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "location"
    t.string "company"
    t.string "job_title"
    t.string "domain"
    t.text "profile_img"
    t.text "introduction"
    t.bigint "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_mentees_on_skill_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "location"
    t.string "damain"
    t.string "years_of_experiences"
    t.string "company"
    t.string "job_title"
    t.date "start_date"
    t.date "end_date"
    t.text "profile_img"
    t.text "introduction"
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

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "image_url"
    t.date "starting_date"
    t.integer "duration"
    t.bigint "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_projects_on_skill_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "mentees", "skills"
  add_foreign_key "mentorships", "mentees"
  add_foreign_key "mentorships", "mentors"
  add_foreign_key "mentorships", "projects"
  add_foreign_key "projects", "skills"
end
