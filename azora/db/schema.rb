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

ActiveRecord::Schema.define(version: 20170824090841) do

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "subject",    limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "continents", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "permalink",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "banner",             limit: 255
    t.text     "visa_requirement",   limit: 65535
    t.string   "permalink",          limit: 255
    t.integer  "continent_id",       limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.boolean  "free_visa",                        default: false
    t.integer  "free_visa_duration", limit: 4,     default: 0
    t.boolean  "visa_on_arrival",                  default: false
    t.integer  "voa_duration",       limit: 4,     default: 0
  end

  create_table "galleries", force: :cascade do |t|
    t.string   "image",        limit: 255
    t.string   "title",        limit: 255
    t.text     "description",  limit: 65535
    t.integer  "country_id",   limit: 4
    t.boolean  "is_primary"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "continent_id", limit: 4
  end

  create_table "news", force: :cascade do |t|
    t.string   "banner",        limit: 255
    t.string   "title",         limit: 255
    t.text     "content",       limit: 65535
    t.text     "short_content", limit: 65535
    t.string   "user",          limit: 255
    t.string   "permalink",     limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "system_settings", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "value",      limit: 65535
    t.string   "permalink",  limit: 255
    t.integer  "parent_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tour_details", force: :cascade do |t|
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "price",          limit: 4
    t.text     "pricing_detail", limit: 65535
    t.text     "note",           limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "tour_images", force: :cascade do |t|
    t.string   "image",      limit: 255
    t.integer  "tour_id",    limit: 4
    t.boolean  "is_primary"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tour_itineraries", force: :cascade do |t|
    t.string   "day",         limit: 255
    t.text     "description", limit: 65535
    t.integer  "tour_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "title",       limit: 255
  end

  create_table "tours", force: :cascade do |t|
    t.string   "type",              limit: 255
    t.string   "name",              limit: 255
    t.text     "short_description", limit: 65535
    t.text     "description",       limit: 65535
    t.date     "expired_date"
    t.integer  "duration",          limit: 4
    t.string   "permalink",         limit: 255
    t.integer  "country_id",        limit: 4
    t.integer  "itinerary_id",      limit: 4
    t.integer  "tour_detail_id",    limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
