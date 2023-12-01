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

ActiveRecord::Schema[7.1].define(version: 2023_12_01_043816) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branch_policies", force: :cascade do |t|
    t.bigint "branch_id", null: false
    t.bigint "user_id", null: false
    t.date "date_access_from", null: false
    t.date "date_access_to", null: false
    t.time "time_access_from", null: false
    t.time "time_access_to", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_branch_policies_on_branch_id"
    t.index ["user_id", "branch_id"], name: "index_branch_policies_on_user_id_and_branch_id", unique: true
    t.index ["user_id"], name: "index_branch_policies_on_user_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "branch_name", null: false
    t.string "branch_code", null: false
    t.string "nickname", null: false
    t.bigint "creator_id", null: false
    t.integer "ibt_gl", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_head_office", default: false, null: false
    t.index ["creator_id"], name: "index_branches_on_creator_id"
  end

  create_table "customers", force: :cascade do |t|
    t.integer "profile_id", null: false
    t.date "introduced_date", null: false
    t.bigint "branch_id", null: false
    t.boolean "status", default: true, null: false
    t.date "termination_date"
    t.bigint "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_customers_on_branch_id"
    t.index ["creator_id"], name: "index_customers_on_creator_id"
  end

  create_table "kyc_addresses", force: :cascade do |t|
    t.bigint "kyc_personal_id", null: false
    t.string "address_type", null: false
    t.integer "province", null: false
    t.integer "district", null: false
    t.integer "mn_vdc", null: false
    t.integer "ward_no", null: false
    t.string "street"
    t.string "tole_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kyc_personal_id"], name: "index_kyc_addresses_on_kyc_personal_id"
  end

  create_table "kyc_contacts", force: :cascade do |t|
    t.bigint "kyc_personal_id", null: false
    t.string "contact_type", null: false
    t.string "contact_relation", null: false
    t.string "contact_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kyc_personal_id"], name: "index_kyc_contacts_on_kyc_personal_id"
  end

  create_table "kyc_personals", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.boolean "is_minor", default: false, null: false
    t.boolean "is_residential", default: true, null: false
    t.string "salutation", null: false
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.string "gender", null: false
    t.date "date_of_birth", null: false
    t.string "email"
    t.string "maritial_status", null: false
    t.string "pan_number"
    t.string "nea_customer_id"
    t.string "khanepani_customer_id"
    t.string "voting_address"
    t.string "qualification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_kyc_personals_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name", null: false
    t.string "contact"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti"
    t.bigint "branch_id", null: false
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "branch_policies", "branches"
  add_foreign_key "branch_policies", "users"
  add_foreign_key "branches", "users", column: "creator_id"
  add_foreign_key "customers", "branches"
  add_foreign_key "customers", "users", column: "creator_id"
  add_foreign_key "kyc_addresses", "kyc_personals"
  add_foreign_key "kyc_contacts", "kyc_personals"
  add_foreign_key "kyc_personals", "customers"
  add_foreign_key "users", "branches"
end
