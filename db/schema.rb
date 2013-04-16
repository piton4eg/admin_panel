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

ActiveRecord::Schema.define(:version => 20130414193041) do

  create_table "sprint_stats", :force => true do |t|
    t.float    "velocity",   :default => 0.0, :null => false
    t.float    "points",     :default => 0.0, :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "sprints", :force => true do |t|
    t.string   "name",          :default => "Наименование",        :null => false
    t.float    "points",        :default => 0.0,                   :null => false
    t.integer  "unknown_level", :default => 0,                     :null => false
    t.float    "fact_points",   :default => 0.0,                   :null => false
    t.float    "hours_count",   :default => 0.0,                   :null => false
    t.string   "status",        :default => "Планируемый",         :null => false
    t.datetime "date_begin",    :default => '2013-01-01 00:00:00', :null => false
    t.datetime "date_end",      :default => '2013-01-01 00:00:00', :null => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

end
