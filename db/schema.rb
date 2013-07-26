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

ActiveRecord::Schema.define(:version => 20130726122844) do

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "source"
    t.string   "type"
    t.string   "uploadedfile"
  end

  create_table "articles_doctors", :id => false, :force => true do |t|
    t.integer "doctor_id"
    t.integer "article_id"
  end

  add_index "articles_doctors", ["doctor_id", "article_id"], :name => "index_articles_doctors_on_doctor_id_and_article_id"

  create_table "doctors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string "title"
    t.string "sub_title"
    t.text   "description"
    t.date   "day"
  end

  create_table "users", :force => true do |t|
    t.string   "username",        :limit => 25
    t.string   "email",           :limit => 100, :null => false
    t.string   "hashed_password"
    t.string   "salt",            :limit => 40
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
