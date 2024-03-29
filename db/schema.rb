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

ActiveRecord::Schema.define(:version => 20131018001045) do

  create_table "comments", :force => true do |t|
    t.integer  "parent_comment_id"
    t.integer  "link_id"
    t.text     "body"
    t.integer  "commenter_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "comments", ["commenter_id"], :name => "index_comments_on_commenter_id"
  add_index "comments", ["link_id"], :name => "index_comments_on_link_id"
  add_index "comments", ["parent_comment_id"], :name => "index_comments_on_parent_comment_id"

  create_table "link_subs", :force => true do |t|
    t.integer  "sub_id"
    t.integer  "link_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "link_subs", ["link_id"], :name => "index_link_subs_on_link_id"
  add_index "link_subs", ["sub_id"], :name => "index_link_subs_on_sub_id"

  create_table "link_votes", :force => true do |t|
    t.integer  "voter_id"
    t.integer  "link_id"
    t.integer  "vote"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "link_votes", ["link_id"], :name => "index_link_votes_on_link_id"
  add_index "link_votes", ["voter_id"], :name => "index_link_votes_on_voter_id"

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "submitter_id"
  end

  add_index "links", ["title"], :name => "index_links_on_title"

  create_table "subs", :force => true do |t|
    t.string   "name"
    t.integer  "moderator_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "subs", ["name"], :name => "index_subs_on_name"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "session_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["name"], :name => "index_users_on_name"

end
