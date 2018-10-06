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

ActiveRecord::Schema.define(version: 2018_10_06_144848) do

  create_table "hangs", force: :cascade do |t|
    t.integer "hoa_don_id"
    t.integer "vat_lieu_id"
    t.float "gia"
    t.float "so_luong"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hoa_don_id"], name: "index_hangs_on_hoa_don_id"
    t.index ["vat_lieu_id"], name: "index_hangs_on_vat_lieu_id"
  end

  create_table "hoa_dons", force: :cascade do |t|
    t.date "ngay"
    t.integer "nha_cung_cap_id"
    t.string "nguoi_ki"
    t.float "thanh_toan"
    t.float "so_du"
    t.string "file"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nha_cung_cap_id"], name: "index_hoa_dons_on_nha_cung_cap_id"
  end

  create_table "nha_cung_caps", force: :cascade do |t|
    t.string "ten"
    t.string "sodienthoai"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vat_lieus", force: :cascade do |t|
    t.string "ten"
    t.string "loai"
    t.string "note"
    t.string "donvi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
