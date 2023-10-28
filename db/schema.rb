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

ActiveRecord::Schema.define(version: 20231028175925) do

  create_table "campus", id: false, force: :cascade do |t|
    t.string "campusCode", limit: 4
    t.string "campusName", limit: 128
  end

  add_index "campus", ["campusCode"], name: "campusCode", using: :btree

  create_table "course", primary_key: "courseID", force: :cascade do |t|
    t.string  "courseSubtitle", limit: 256
    t.string  "courseTitle",    limit: 256
    t.string  "courseCode",     limit: 4
    t.string  "typeName",       limit: 64
    t.integer "prefixID",       limit: 4
    t.string  "departmentCode", limit: 4
    t.string  "schoolCode",     limit: 4
    t.string  "divisionCode",   limit: 4
    t.string  "prefixCode",     limit: 4
  end

  add_index "course", ["departmentCode"], name: "departmentCode", using: :btree
  add_index "course", ["divisionCode"], name: "divisionCode", using: :btree
  add_index "course", ["prefixID"], name: "prefixID", using: :btree
  add_index "course", ["schoolCode"], name: "schoolCode", using: :btree

  create_table "courses_requirements", id: false, force: :cascade do |t|
    t.integer "reqID",    limit: 4, null: false
    t.integer "courseID", limit: 4, null: false
  end

  add_index "courses_requirements", ["courseID"], name: "courseID", using: :btree
  add_index "courses_requirements", ["reqID"], name: "reqID", using: :btree

  create_table "department", id: false, force: :cascade do |t|
    t.string "departmentCode", limit: 4
    t.string "departmentName", limit: 128
  end

  add_index "department", ["departmentCode"], name: "departmentCode", using: :btree

  create_table "division", id: false, force: :cascade do |t|
    t.string "divisionCode", limit: 4
    t.string "divisionName", limit: 128
  end

  add_index "division", ["divisionCode"], name: "divisionCode", using: :btree

  create_table "instructor", id: false, force: :cascade do |t|
    t.string "instructorLastName",   limit: 64, null: false
    t.string "instructorFirstName",  limit: 64, null: false
    t.string "instructorMiddleName", limit: 64, null: false
    t.string "departmentCode",       limit: 4,  null: false
  end

  add_index "instructor", ["departmentCode"], name: "departmentCode", using: :btree

  create_table "major_minor", primary_key: "major_minorID", force: :cascade do |t|
    t.string "major_minorName", limit: 255, null: false
    t.string "typeName",        limit: 5
    t.string "departmentCode",  limit: 4
  end

  add_index "major_minor", ["departmentCode"], name: "departmentCode", using: :btree

  create_table "prefix", primary_key: "prefixID", force: :cascade do |t|
    t.string "prefixCode",     limit: 4
    t.string "prefixName",     limit: 128
    t.string "prefixLongname", limit: 256
  end

  create_table "requirement", primary_key: "reqID", force: :cascade do |t|
    t.integer "major_minorID", limit: 4
    t.string  "divisionCode",  limit: 4
    t.string  "reqType",       limit: 6
    t.string  "reqLabel",      limit: 255
    t.text    "reqDesc",       limit: 65535
    t.string  "courses",       limit: 5000
    t.integer "numCourses",    limit: 4
    t.integer "creditLim",     limit: 4
  end

  add_index "requirement", ["divisionCode"], name: "divisionCode", using: :btree
  add_index "requirement", ["major_minorID"], name: "major_minorID", using: :btree

  create_table "school", id: false, force: :cascade do |t|
    t.string "schoolCode", limit: 4
    t.string "schoolName", limit: 128
  end

  add_index "school", ["schoolCode"], name: "schoolCode", using: :btree

  create_table "section", id: false, force: :cascade do |t|
    t.integer "CallNumber",       limit: 4,    null: false
    t.string  "termSeason",       limit: 6,    null: false
    t.integer "termYear",         limit: 4,    null: false
    t.integer "courseID",         limit: 4
    t.string  "sectionCode",      limit: 3
    t.string  "classNotes",       limit: 1024
    t.string  "Approval",         limit: 2
    t.string  "EnrollmentStatus", limit: 1,    null: false
    t.integer "MaxSize",          limit: 4
    t.integer "NumEnrolled",      limit: 4
  end

  add_index "section", ["courseID"], name: "courseID", using: :btree

  create_table "teaches", id: false, force: :cascade do |t|
    t.integer "CallNumber",           limit: 4,  null: false
    t.string  "termSeason",           limit: 6,  null: false
    t.integer "termYear",             limit: 4,  null: false
    t.string  "instructorLastName",   limit: 64, null: false
    t.string  "instructorFirstName",  limit: 64, null: false
    t.string  "instructorMiddleName", limit: 64, null: false
    t.string  "departmentCode",       limit: 4,  null: false
  end

  add_foreign_key "course", "department", column: "departmentCode", primary_key: "departmentCode", name: "course_ibfk_2"
  add_foreign_key "course", "division", column: "divisionCode", primary_key: "divisionCode", name: "course_ibfk_4"
  add_foreign_key "course", "prefix", column: "prefixID", primary_key: "prefixID", name: "course_ibfk_1"
  add_foreign_key "course", "school", column: "schoolCode", primary_key: "schoolCode", name: "course_ibfk_3"
  add_foreign_key "courses_requirements", "course", column: "courseID", primary_key: "courseID", name: "courses_requirements_ibfk_2"
  add_foreign_key "courses_requirements", "requirement", column: "reqID", primary_key: "reqID", name: "courses_requirements_ibfk_1"
  add_foreign_key "instructor", "department", column: "departmentCode", primary_key: "departmentCode", name: "instructor_ibfk_1"
  add_foreign_key "major_minor", "department", column: "departmentCode", primary_key: "departmentCode", name: "major_minor_ibfk_1"
  add_foreign_key "requirement", "division", column: "divisionCode", primary_key: "divisionCode", name: "requirement_ibfk_2"
  add_foreign_key "requirement", "major_minor", column: "major_minorID", primary_key: "major_minorID", name: "requirement_ibfk_1"
  add_foreign_key "section", "course", column: "courseID", primary_key: "courseID", name: "section_ibfk_1"
end
