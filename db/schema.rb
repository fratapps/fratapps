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

ActiveRecord::Schema.define(:version => 20100929031738) do

  create_table "groups", :force => true do |t|
    t.string   "group_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["group_name"], :name => "index_groups_on_group_name", :unique => true

  create_table "points", :force => true do |t|
    t.integer  "user_id"
    t.integer  "points",     :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "points", ["user_id"], :name => "index_points_on_user_id"

  create_table "poll_answers", :force => true do |t|
    t.string   "answer"
    t.integer  "vote_count"
    t.integer  "poll_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poll_questions", :force => true do |t|
    t.string   "question"
    t.integer  "max_responses"
    t.integer  "created_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poll_votes", :force => true do |t|
    t.integer  "poll_question_id"
    t.integer  "poll_answer_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_instances", :force => true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.string   "status",      :default => "open"
    t.date     "taken_on"
    t.date     "complete_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.integer  "created_by_id"
    t.integer  "points"
    t.text     "description"
    t.integer  "taken_by_id"
    t.integer  "user_id"
    t.string   "status",        :default => "open"
    t.date     "taken_on"
    t.date     "complete_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "encrypted_password"
    t.string   "salt"
    t.integer  "total_points",       :default => 0
    t.boolean  "super_admin",        :default => false
    t.string   "email"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["group_id"], :name => "index_users_on_group_id"

end
