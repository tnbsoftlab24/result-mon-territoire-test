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

ActiveRecord::Schema[7.0].define(version: 2023_02_06_152447) do
  create_table "communes", force: :cascade do |t|
    t.string "Intercommunality"
    t.string "street"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "intercommunality_id"
    t.string "name"
    t.integer "code_insee"
    t.integer "street_id"
    t.integer "population"
    t.json "geometry"
    t.index ["intercommunality_id"], name: "index_communes_on_intercommunality_id"
    t.index ["street_id"], name: "index_communes_on_street_id"
  end

  create_table "intercommunalities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "siren"
    t.string "form"
    t.string "slug"
    t.integer "population"
  end

  create_table "parcels", force: :cascade do |t|
    t.string "number"
    t.integer "prefix"
    t.string "section"
    t.string "plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "streets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "commune_id", null: false
    t.string "title"
    t.integer "to"
    t.integer "from"
    t.index ["commune_id"], name: "index_streets_on_commune_id"
  end

  add_foreign_key "communes", "intercommunalities"
  add_foreign_key "communes", "streets"
  add_foreign_key "streets", "communes"
end
