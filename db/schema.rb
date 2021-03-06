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

ActiveRecord::Schema.define(:version => 20131112184757) do

  create_table "admin_courses", :force => true do |t|
    t.string   "course_type"
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.time     "timing"
    t.string   "venue"
    t.text     "description"
    t.decimal  "fees",        :precision => 10, :scale => 0
    t.decimal  "discounts",   :precision => 10, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "email"
    t.integer  "batch"
    t.text     "curriculam"
    t.integer  "phone_no"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "source"
    t.string   "type"
    t.string   "file_caption_0"
    t.string   "file_caption_1"
    t.string   "file_caption_2"
    t.string   "youtubeurl"
    t.integer  "sharecount",     :default => 0
    t.integer  "viewcount",      :default => 0
    t.boolean  "is_paid",        :default => false
  end

  create_table "articles_doctors", :id => false, :force => true do |t|
    t.integer "doctor_id"
    t.integer "article_id"
  end

  add_index "articles_doctors", ["doctor_id", "article_id"], :name => "index_articles_doctors_on_doctor_id_and_article_id"

  create_table "articles_tags", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "tag_id"
  end

  add_index "articles_tags", ["article_id", "tag_id"], :name => "index_articles_tags_on_article_id_and_tag_id"

  create_table "doctors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title"
    t.string   "designation"
    t.text     "description"
    t.string   "source"
  end

  create_table "events", :force => true do |t|
    t.string  "title"
    t.text    "other_description"
    t.text    "description"
    t.date    "day"
    t.integer "fees"
    t.date    "end_date"
    t.string  "event_type"
    t.string  "caption_0"
    t.string  "caption_1"
    t.string  "caption_2"
    t.string  "source"
    t.boolean "publish",           :default => false
  end

  create_table "tags", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "testimonial_videos", :force => true do |t|
    t.string   "title"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "testimonials", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "testimonial_video"
    t.string   "testimonial_by"
    t.text     "description"
    t.string   "source"
  end

  create_table "urls", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "doctor_id"
  end

  create_table "users", :force => true do |t|
    t.string   "username",        :limit => 25
    t.string   "email",           :limit => 100,                    :null => false
    t.string   "hashed_password"
    t.string   "salt",            :limit => 40
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.boolean  "isAdmin",                        :default => false
  end

  add_index "users", ["username"], :name => "index_users_on_username"

  create_table "workshop_videos", :force => true do |t|
    t.string   "title"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
