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

ActiveRecord::Schema.define(version: 20160423203439) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "points_earned"
    t.integer  "points_possible"
    t.integer  "order"
    t.datetime "due_at"
    t.datetime "completed_at"
    t.string   "time_zone_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "course_id"
  end

  add_index "assignments", ["course_id"], name: "index_assignments_on_course_id"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "assignment_id"
  end

  add_index "courses", ["assignment_id"], name: "index_courses_on_assignment_id"

  create_table "student_courses", force: :cascade do |t|
    t.integer  "student_id", null: false
    t.integer  "course_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "student_courses", ["course_id"], name: "index_student_courses_on_course_id"
  add_index "student_courses", ["student_id"], name: "index_student_courses_on_student_id"

  create_table "students", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nickname"
    t.integer  "graduation_year", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "teacher_courses", force: :cascade do |t|
    t.integer  "teacher_id", null: false
    t.integer  "course_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teacher_courses", ["course_id"], name: "index_teacher_courses_on_course_id"
  add_index "teacher_courses", ["teacher_id"], name: "index_teacher_courses_on_teacher_id"

  create_table "teachers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "mobile_number"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
