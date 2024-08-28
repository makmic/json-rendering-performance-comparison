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

ActiveRecord::Schema[7.1].define(version: 2024_08_28_072230) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fat_models", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attribute_1"
    t.string "attribute_2"
    t.string "attribute_3"
    t.string "attribute_4"
    t.string "attribute_5"
    t.string "attribute_6"
    t.string "attribute_7"
    t.string "attribute_8"
    t.string "attribute_9"
    t.string "attribute_10"
    t.string "attribute_11"
    t.string "attribute_12"
    t.string "attribute_13"
    t.string "attribute_14"
    t.string "attribute_15"
    t.string "attribute_16"
    t.string "attribute_17"
    t.string "attribute_18"
    t.string "attribute_19"
    t.string "attribute_20"
    t.string "attribute_21"
    t.string "attribute_22"
    t.string "attribute_23"
    t.string "attribute_24"
    t.string "attribute_25"
    t.string "attribute_26"
    t.string "attribute_27"
    t.string "attribute_28"
    t.string "attribute_29"
    t.string "attribute_30"
    t.string "indexed_attribute_1"
    t.index ["indexed_attribute_1"], name: "index_fat_models_on_indexed_attribute_1"
    t.index ["updated_at"], name: "index_fat_models_on_updated_at"
  end

end
