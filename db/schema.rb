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

ActiveRecord::Schema.define(version: 20131009201110) do

  create_table "movies", force: true do |t|
    t.string   "title"
    t.text     "poster_url"
    t.text     "trailer_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "character"
    t.integer  "movie_id"
    t.integer  "star_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["movie_id"], name: "index_roles_on_movie_id"
  add_index "roles", ["star_id"], name: "index_roles_on_star_id"

  create_table "showtimes", force: true do |t|
    t.string   "location"
    t.string   "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "movie_id"
  end

  create_table "stars", force: true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "headshot_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
