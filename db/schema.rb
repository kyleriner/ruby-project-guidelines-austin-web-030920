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

ActiveRecord::Schema.define(version: 6) do

  create_table "character_klasses", force: :cascade do |t|
    t.integer "character_id"
    t.integer "klass_id"
  end

  create_table "character_spells", force: :cascade do |t|
    t.integer "character_id"
    t.integer "spell_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "level"
  end

  create_table "klass_spells", force: :cascade do |t|
    t.integer "klass_id"
    t.integer "spell_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.string "name"
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.string "desc"
  end

end
