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

ActiveRecord::Schema.define(:version => 20120806123633) do

  create_table "answers", :force => true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "fulltext"
    t.text     "book_name"
    t.string   "book_author"
    t.string   "book_link"
    t.integer  "likes_count",    :default => 0, :null => false
    t.integer  "comments_count", :default => 0, :null => false
  end

  create_table "assigments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "briefings", :force => true do |t|
    t.text     "title"
    t.text     "description"
    t.text     "category"
    t.text     "source"
    t.boolean  "is_quote"
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.text     "video"
    t.integer  "likes_count",          :default => 0, :null => false
    t.integer  "comments_count",       :default => 0, :null => false
    t.string   "slug"
  end

  add_index "briefings", ["created_at"], :name => "index_briefings_on_created_at"
  add_index "briefings", ["slug"], :name => "index_briefings_on_slug", :unique => true

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id",   :default => 0
    t.string   "commentable_type", :default => ""
    t.string   "title",            :default => ""
    t.text     "body",             :default => ""
    t.string   "subject",          :default => ""
    t.integer  "user_id",          :default => 0,  :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "oauth2_access_tokens", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "refresh_token_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "oauth2_access_tokens", ["client_id"], :name => "index_oauth2_access_tokens_on_client_id"
  add_index "oauth2_access_tokens", ["expires_at"], :name => "index_oauth2_access_tokens_on_expires_at"
  add_index "oauth2_access_tokens", ["token"], :name => "index_oauth2_access_tokens_on_token", :unique => true
  add_index "oauth2_access_tokens", ["user_id"], :name => "index_oauth2_access_tokens_on_user_id"

  create_table "oauth2_authorization_codes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "oauth2_authorization_codes", ["client_id"], :name => "index_oauth2_authorization_codes_on_client_id"
  add_index "oauth2_authorization_codes", ["expires_at"], :name => "index_oauth2_authorization_codes_on_expires_at"
  add_index "oauth2_authorization_codes", ["token"], :name => "index_oauth2_authorization_codes_on_token", :unique => true
  add_index "oauth2_authorization_codes", ["user_id"], :name => "index_oauth2_authorization_codes_on_user_id"

  create_table "oauth2_clients", :force => true do |t|
    t.string   "name"
    t.string   "redirect_uri"
    t.string   "website"
    t.string   "identifier"
    t.string   "secret"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "oauth2_clients", ["identifier"], :name => "index_oauth2_clients_on_identifier", :unique => true

  create_table "oauth2_refresh_tokens", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "oauth2_refresh_tokens", ["client_id"], :name => "index_oauth2_refresh_tokens_on_client_id"
  add_index "oauth2_refresh_tokens", ["expires_at"], :name => "index_oauth2_refresh_tokens_on_expires_at"
  add_index "oauth2_refresh_tokens", ["token"], :name => "index_oauth2_refresh_tokens_on_token", :unique => true
  add_index "oauth2_refresh_tokens", ["user_id"], :name => "index_oauth2_refresh_tokens_on_user_id"

  create_table "questions", :force => true do |t|
    t.text     "title"
    t.text     "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.string   "state"
    t.integer  "answers_count", :default => 0, :null => false
    t.boolean  "is_top"
    t.string   "slug"
  end

  add_index "questions", ["answers_count", "state"], :name => "index_questions_on_answers_count_and_state"
  add_index "questions", ["category"], :name => "index_questions_on_category"
  add_index "questions", ["created_at"], :name => "index_questions_on_created_at"
  add_index "questions", ["is_top"], :name => "index_questions_on_is_top"
  add_index "questions", ["slug"], :name => "index_questions_on_slug", :unique => true
  add_index "questions", ["state"], :name => "index_questions_on_state"
  add_index "questions", ["title"], :name => "index_questions_on_title"
  add_index "questions", ["updated_at"], :name => "index_questions_on_updated_at"
  add_index "questions", ["user_id"], :name => "index_questions_on_user_id"

  create_table "rss_links", :force => true do |t|
    t.text     "link"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "items_data",  :limit => 10485760
    t.text     "shares_data", :limit => 10485760
    t.string   "category",                        :default => "popular", :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                               :default => "",      :null => false
    t.string   "encrypted_password",   :limit => 128, :default => ""
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                                :default => "guest"
    t.string   "invitation_token",     :limit => 60
    t.datetime "invitation_sent_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "occupation"
    t.string   "company"
    t.string   "location"
    t.string   "contact_email"
    t.string   "google_plus"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "twitter"
    t.text     "in_brief"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
