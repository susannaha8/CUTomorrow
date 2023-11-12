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

ActiveRecord::Schema.define(version: 20231111125859) do

  create_table "add_required_courses_triggers", force: :cascade do |t|
  end

  create_table "coursereqs", primary_key: "coursereqsID", force: :cascade do |t|
    t.integer "reqID"
    t.integer "courseID"
  end

  create_table "courses", primary_key: "courseID", force: :cascade do |t|
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

  create_table "requirements", primary_key: "reqID", force: :cascade do |t|
    t.integer "major_minorID", limit: 4
    t.string  "divisionCode",  limit: 4
    t.string  "reqType",       limit: 6
    t.string  "reqLabel",      limit: 255
    t.text    "reqDesc",       limit: 65535
    t.string  "courses",       limit: 5000
    t.integer "numCourses",    limit: 4
    t.integer "creditLim",     limit: 4
  end

  create_table "schedules", primary_key: "schedID", force: :cascade do |t|
    t.string  "uni",      limit: 10
    t.integer "courseID"
    t.integer "reqID"
    t.string  "semester", limit: 20
    t.boolean "taken"
  end

  create_table "students", force: :cascade do |t|
    t.string  "email"
    t.string  "uni"
    t.integer "major1"
    t.integer "major2"
    t.integer "major3"
    t.integer "minor1"
    t.integer "minor2"
    t.integer "minor3"
    t.integer "minor4"
    t.string  "firstName"
    t.string  "lastName"
    t.string  "standing"
    t.string  "password_digest"
  end

end
