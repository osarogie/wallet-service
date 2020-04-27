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

ActiveRecord::Schema.define(version: 2020_04_27_034932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.text "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_branches_on_name"
  end

  create_table "customer_accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "account_name"
    t.string "account_number"
    t.bigint "branch_id"
    t.money "balance", scale: 2
    t.integer "account_type"
    t.boolean "is_open"
    t.money "lien", scale: 2
    t.money "interest", scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_name"], name: "index_customer_accounts_on_account_name"
    t.index ["account_number"], name: "index_customer_accounts_on_account_number"
    t.index ["branch_id"], name: "index_customer_accounts_on_branch_id"
    t.index ["user_id"], name: "index_customer_accounts_on_user_id"
  end

  create_table "gl_accounts", force: :cascade do |t|
    t.string "name"
    t.bigint "gl_category_id", null: false
    t.bigint "branch_id", null: false
    t.integer "code"
    t.boolean "is_assigned"
    t.money "balance", scale: 2
    t.boolean "is_till_account"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id"], name: "index_gl_accounts_on_branch_id"
    t.index ["gl_category_id"], name: "index_gl_accounts_on_gl_category_id"
    t.index ["name"], name: "index_gl_accounts_on_name"
  end

  create_table "gl_categories", force: :cascade do |t|
    t.string "name"
    t.integer "main_account_category"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["main_account_category"], name: "index_gl_categories_on_main_account_category"
    t.index ["name"], name: "index_gl_categories_on_name"
  end

  create_table "gl_posts", force: :cascade do |t|
    t.bigint "gl_account_to_credit_id", null: false
    t.bigint "gl_account_to_debit_id", null: false
    t.money "amount", scale: 2
    t.text "narration"
    t.bigint "user_id", null: false
    t.datetime "posted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gl_account_to_credit_id"], name: "index_gl_posts_on_gl_account_to_credit_id"
    t.index ["gl_account_to_debit_id"], name: "index_gl_posts_on_gl_account_to_debit_id"
    t.index ["user_id"], name: "index_gl_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "full_name"
    t.string "phone_number"
    t.bigint "branch_id"
    t.integer "level", default: 0
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["level"], name: "index_users_on_level"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "customer_accounts", "branches"
  add_foreign_key "customer_accounts", "users"
  add_foreign_key "gl_accounts", "branches"
  add_foreign_key "gl_accounts", "gl_categories"
  add_foreign_key "gl_posts", "gl_accounts", column: "gl_account_to_credit_id"
  add_foreign_key "gl_posts", "gl_accounts", column: "gl_account_to_debit_id"
  add_foreign_key "gl_posts", "users"
  add_foreign_key "users", "branches"
end
