# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_21_053723) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_team_logs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "account_team_id"
    t.integer "start_date"
    t.integer "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_team_id"], name: "index_account_team_logs_on_account_team_id"
    t.index ["end_date"], name: "index_account_team_logs_on_end_date"
    t.index ["start_date"], name: "index_account_team_logs_on_start_date"
    t.index ["user_id"], name: "index_account_team_logs_on_user_id"
  end

  create_table "account_team_users", force: :cascade do |t|
    t.integer "account_team_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_team_id", "user_id"], name: "index_account_team_users_on_account_team_id_and_user_id", unique: true
  end

  create_table "account_teams", force: :cascade do |t|
    t.integer "account_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "account_id"], name: "index_account_teams_on_name_and_account_id", unique: true
  end

  create_table "accounts", force: :cascade do |t|
    t.string "account_name"
    t.string "customer_name"
    t.integer "responsible_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_name"], name: "index_accounts_on_account_name"
    t.index ["customer_name"], name: "index_accounts_on_customer_name"
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at", precision: nil
    t.string "crypted_password"
    t.string "salt"
    t.string "role"
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
