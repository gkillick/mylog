# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100309005330) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activities_sports", :id => false, :force => true do |t|
    t.integer "activity_id"
    t.integer "sport_id"
  end

  create_table "athletes_coaches", :id => false, :force => true do |t|
    t.integer "athlete_id"
    t.integer "coach_id"
  end

  create_table "log_entries", :force => true do |t|
    t.date     "date"
    t.text     "summary"
    t.integer  "activity_id"
    t.integer  "athlete_id"
    t.integer  "feel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",               :null => false
    t.string   "crypted_password",    :null => false
    t.string   "password_salt",       :null => false
    t.string   "persistence_token",   :null => false
    t.string   "single_access_token", :null => false
    t.string   "perishable_token",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "workouts", :force => true do |t|
    t.integer  "duration"
    t.string   "time_of_day"
    t.integer  "activity_id"
    t.integer  "log_entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
