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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130215042424) do

  create_table "comments", :force => true do |t|
    t.string   "user_id"
    t.date     "date"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "repbody_id"
  end

  create_table "myfiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "filename"
    t.string   "caption"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "repbodies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tag_id"
    t.date     "date"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "commentexis"
    t.integer  "lock_version", :default => 0
    t.integer  "year"
  end

  create_table "roles", :force => true do |t|
    t.string   "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "tag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "updates", :force => true do |t|
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "repbody_id"
    t.string   "date"
  end

  create_table "users", :force => true do |t|
    t.string   "account"
    t.string   "username"
    t.string   "studentid"
    t.string   "email"
    t.integer  "role_id"
    t.string   "grade"
    t.string   "password_digest"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "machine"
    t.integer  "year",            :default => 2013
  end

  create_table "years", :force => true do |t|
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "default"
  end

end
