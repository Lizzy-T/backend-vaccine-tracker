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

ActiveRecord::Schema.define(version: 2019_12_02_224107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "my_vaccines", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "vaccine_id", null: false
    t.date "given"
    t.date "exp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_my_vaccines_on_user_id"
    t.index ["vaccine_id"], name: "index_my_vaccines_on_vaccine_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vaccines", force: :cascade do |t|
    t.string "name"
    t.boolean "routine"
    t.string "when_to_vaccinate"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "my_vaccines", "users"
  add_foreign_key "my_vaccines", "vaccines"
end
