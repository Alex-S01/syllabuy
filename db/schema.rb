# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_30_150331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "summary"
    t.integer "pages"
    t.integer "price"
    t.integer "edition_year"
    t.string "ISBN"
    t.string "language"
    t.string "publisher"
    t.boolean "status"
    t.string "delivery_method"
    t.string "selling_address"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "topic"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "payment_method"
    t.date "purchase_date_time"
    t.date "closing_date_time"
    t.bigint "user_id", null: false
    t.bigint "books_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["books_id"], name: "index_purchases_on_books_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "content"
    t.bigint "purchase_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["purchase_id"], name: "index_reviews_on_purchase_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "university"
    t.integer "year_of_study"
    t.string "about_me"
    t.date "date_of_birth"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "books", "users"
  add_foreign_key "purchases", "books", column: "books_id"
  add_foreign_key "purchases", "users"
  add_foreign_key "reviews", "purchases"
end
