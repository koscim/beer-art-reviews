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

ActiveRecord::Schema.define(version: 20170906152235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "art_labels", force: :cascade do |t|
    t.string "name", null: false
    t.string "image_url", null: false
    t.string "brewery", null: false
    t.string "beer_style"
    t.string "art_style"
    t.string "container_type"
    t.text "beer_description"
    t.text "art_description"
    t.integer "beer_rating"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "feels", null: false
    t.integer "intoxication_level"
    t.integer "joy"
    t.integer "fear"
    t.integer "sadness"
    t.integer "disgust"
    t.integer "anger"
    t.integer "cleverness"
    t.integer "collectability"
    t.integer "controversiality"
    t.integer "buyability"
    t.integer "user_id", null: false
    t.integer "art_label_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "review_id", null: false
    t.integer "vote_number", null: false
  end

end
