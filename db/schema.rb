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

ActiveRecord::Schema.define(version: 20140925005215) do

  create_table "trainees", force: true do |t|
    t.text     "name"
    t.text     "umid"
    t.text     "phone"
    t.text     "email"
    t.text     "status"
    t.text     "dept"
    t.text     "experience"
    t.text     "referral"
    t.text     "interests"
    t.text     "statement"
    t.text     "stage1"
    t.text     "demotape"
    t.text     "stage2"
    t.text     "apprenticeship_freeform1"
    t.text     "apprenticeship_freeform2"
    t.text     "apprenticeship_specialty1"
    t.text     "apprenticeship_specialty2"
    t.text     "broadcasters_exam"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
