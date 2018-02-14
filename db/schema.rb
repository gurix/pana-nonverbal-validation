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

ActiveRecord::Schema.define(version: 20180212125428) do

  create_table "pana_validation_questionaries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "subject_id"
    t.integer "page", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "who1"
    t.integer "who2"
    t.integer "who3"
    t.integer "who4"
    t.integer "who5"
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
    t.integer "pnv1"
    t.integer "pnv2"
    t.integer "pnv3"
    t.integer "pnv4"
    t.integer "pnv5"
    t.integer "pnv6"
    t.integer "pnv7"
    t.integer "pnv8"
    t.integer "pnv9"
    t.integer "pnv10"
    t.integer "swl1"
    t.integer "swl2"
    t.integer "swl3"
    t.integer "swl4"
    t.integer "swl5"
    t.integer "sam1"
    t.integer "sam2"
    t.integer "sam3"
    t.integer "PA3_lo__PA1_hi"
    t.integer "NA2_lo__NA1_hi"
    t.integer "PA4_hi__PA4_lo3"
    t.integer "VA1_lo__NA3_lo"
    t.integer "VA1_hi__VA2_lo"
    t.integer "PA1_lo__PA1_hi"
    t.integer "NA3_lo__NA2_hi"
    t.integer "PA3_hi__PA4_lo"
    t.integer "NA1_hi__NA1_lo"
    t.integer "VA2_hi__VA2_lo"
    t.integer "VA1_hi__VA1_lo"
    t.integer "PA1_hi__PA1_lo"
    t.integer "PA2_lo__PA2_hi1"
    t.integer "NA2_lo__NA2_hi"
    t.integer "VA2_lo__VA2_hi"
    t.integer "PA3_lo__PA3_hi"
    t.integer "NA3_lo__NA3_hi"
    t.integer "NA4_hi__NA4_lo"
    t.integer "PA2_lo__PA2_hi5"
    t.index ["subject_id"], name: "index_pana_validation_questionaries_on_subject_id"
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "age"
    t.string "gender"
    t.integer "education"
    t.string "residence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group"
  end

end
