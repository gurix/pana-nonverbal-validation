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

ActiveRecord::Schema.define(version: 20180207145827) do

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "subject_id"
    t.string "code"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_answers_on_subject_id"
  end

  create_table "pana_validation_questionaries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "emoji1"
    t.integer "emoji2"
    t.integer "emoji3"
    t.integer "emoji4"
    t.integer "emoji5"
    t.integer "emoji6"
    t.integer "emoji7"
    t.integer "emoji8"
    t.integer "emoji9"
    t.integer "emoji10"
    t.integer "wellbeing1"
    t.integer "wellbeing2"
    t.integer "wellbeing3"
    t.integer "wellbeing4"
    t.integer "wellbeing5"
    t.integer "mrs1"
    t.integer "mrs2"
    t.integer "mrs3"
    t.integer "mrs4"
    t.integer "mrs5"
    t.integer "mrs6"
    t.integer "mrs7"
    t.integer "mrs8"
    t.integer "mrs9"
    t.integer "mrs10"
    t.integer "mrs11"
    t.integer "mrs12"
    t.integer "mrs13"
    t.integer "mrs14"
    t.integer "mrs15"
    t.integer "mrs16"
    t.integer "mrs17"
    t.integer "mrs18"
    t.integer "mrs19"
    t.integer "mrs20"
    t.integer "panava1"
    t.integer "panava2"
    t.integer "panava3"
    t.integer "panava4"
    t.integer "panava5"
    t.integer "panava6"
    t.integer "panava7"
    t.integer "panava8"
    t.integer "panava9"
    t.integer "panava10"
    t.integer "swls1"
    t.integer "swls2"
    t.integer "swls3"
    t.integer "swls4"
    t.integer "swls5"
    t.integer "sam1"
    t.integer "sam2"
    t.integer "sam3"
    t.index ["subject_id"], name: "index_pana_validation_questionaries_on_subject_id"
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "age"
    t.string "gender"
    t.integer "education"
    t.string "residence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "page", default: 0
    t.integer "subjects", default: 1
  end

end
