# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_26_120624) do

  create_table "submits", force: :cascade do |t|
    t.string "ip_address", null: false
    t.integer "point_intention"
    t.integer "point_view"
    t.integer "point_expert"
    t.integer "point_tech"
    t.integer "generation"
    t.integer "sex", default: 0
    t.integer "month"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end


  # 統計データ用テーブル(10個)生成
  # aは事業者型、bは社会指向型、cは技術職人型、dはモノづくり楽しみ型、eは職業人型
  create_table "type_a1_statistics", force: :cascade do |t|
    t.integer "generation"
    t.integer "sum", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_a2_statistics", force: :cascade do |t|
    t.integer "generation"
    t.integer "sum", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_b1_statistics", force: :cascade do |t|
    t.integer "generation"
    t.integer "sum", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_b2_statistics", force: :cascade do |t|
    t.integer "generation"
    t.integer "sum", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_c1_statistics", force: :cascade do |t|
    t.integer "generation"
    t.integer "sum", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_c2_statistics", force: :cascade do |t|
    t.integer "generation"
    t.integer "sum", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_d1_statistics", force: :cascade do |t|
    t.integer "generation"
    t.integer "sum", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_d2_statistics", force: :cascade do |t|
    t.integer "generation"
    t.integer "sum", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_e1_statistics", force: :cascade do |t|
    t.integer "generation"
    t.integer "sum", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_e2_statistics", force: :cascade do |t|
    t.integer "generation"
    t.integer "sum", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end