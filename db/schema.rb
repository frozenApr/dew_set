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

ActiveRecord::Schema.define(version: 20171018091049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", id: :serial, force: :cascade do |t|
    t.string "action_type", null: false
    t.string "action_option"
    t.string "target_type"
    t.integer "target_id"
    t.string "user_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_type", "target_id", "action_type"], name: "index_actions_on_target_type_and_target_id_and_action_type"
    t.index ["user_type", "user_id", "action_type"], name: "index_actions_on_user_type_and_user_id_and_action_type"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "author_id"
    t.integer "original_id"
    t.integer "original_author_id"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["original_author_id"], name: "index_comments_on_original_author_id"
    t.index ["original_id"], name: "index_comments_on_original_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "photo_style"
    t.text "content"
    t.text "content_raw"
    t.string "city"
    t.decimal "model_price", precision: 8, scale: 2, default: "0.0"
    t.decimal "cameramen_price", precision: 8, scale: 2, default: "0.0"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "model_num"
    t.integer "cameramen_num"
    t.integer "user_id"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_events_on_city"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.integer "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_id"], name: "index_images_on_imageable_id"
  end

  create_table "makeups", force: :cascade do |t|
    t.string "title"
    t.string "brief_intro"
    t.string "city"
    t.integer "price"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_makeups_on_city"
    t.index ["price"], name: "index_makeups_on_price"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "to_user_id"
    t.integer "room_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["read"], name: "index_messages_on_read"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.string "brief_intro"
    t.string "place"
    t.string "key_word"
    t.integer "kind", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes_count", default: 0
    t.integer "stars_count", default: 0
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "place"
    t.string "time"
    t.string "city"
    t.integer "price"
    t.integer "user_id"
    t.text "content"
    t.string "outcome"
    t.integer "post_type", default: 0
    t.boolean "has_clothing", default: false
    t.boolean "has_modelling", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stars_count", default: 0
    t.index ["city"], name: "index_posts_on_city"
    t.index ["has_clothing"], name: "index_posts_on_has_clothing"
    t.index ["has_modelling"], name: "index_posts_on_has_modelling"
    t.index ["post_type"], name: "index_posts_on_post_type"
    t.index ["price"], name: "index_posts_on_price"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "brief_intro"
    t.string "city"
    t.integer "kind", default: 0
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.decimal "ori_price", precision: 8, scale: 2, default: "0.0"
    t.boolean "free_shipping", default: true
    t.integer "use_state", default: 10
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_products_on_city"
    t.index ["kind"], name: "index_products_on_kind"
    t.index ["price"], name: "index_products_on_price"
    t.index ["use_state"], name: "index_products_on_use_state"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "user_id"
    t.integer "to_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nick_name"
    t.string "phone_number"
    t.integer "gender", default: 0
    t.string "place"
    t.string "avatar"
    t.string "remember_token"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "star_photos_count", default: 0
    t.integer "like_photos_count", default: 0
    t.integer "star_posts_count", default: 0
    t.integer "followers_count", default: 0
    t.integer "following_count", default: 0
    t.index ["nick_name"], name: "index_users_on_nick_name"
    t.index ["phone_number"], name: "index_users_on_phone_number"
  end

end
