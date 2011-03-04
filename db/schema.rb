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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110304193912) do

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "current_velocity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", :force => true do |t|
    t.string   "url"
    t.integer  "project_id"
    t.string   "name"
    t.string   "description"
    t.datetime "accepted_at"
    t.string   "story_type"
    t.integer  "estimate"
    t.string   "current_state"
    t.string   "requested_by"
    t.string   "owned_by"
    t.string   "labels"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "current",       :default => false
  end

  add_index "stories", ["current"], :name => "index_stories_on_current"

end
