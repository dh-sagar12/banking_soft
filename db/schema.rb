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

ActiveRecord::Schema[7.1].define(version: 2023_12_11_172413) do
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

  create_table "deposit_accounts", force: :cascade do |t|
    t.bigint "branch_id", null: false
    t.date "account_opening_date", null: false
    t.bigint "customer_id", null: false
    t.bigint "deposit_product_id", null: false
    t.integer "account_id", null: false
    t.string "account_number", null: false
    t.integer "introducer_id", null: false
    t.decimal "interest_rate", null: false
    t.integer "account_duration"
    t.bigint "interest_frequency_id", null: false
    t.bigint "interest_nominee_id"
    t.bigint "account_nominee_id"
    t.boolean "status", default: true
    t.date "terminated_on"
    t.decimal "minimum_balance", default: "0.0", null: false
    t.decimal "installment_amount"
    t.bigint "installment_frequency_id"
    t.bigint "installment_account_id"
    t.integer "joint_customers", array: true
    t.string "account_name"
    t.string "display_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id", null: false
    t.integer "last_update_by_id", null: false
    t.index ["account_nominee_id"], name: "index_deposit_accounts_on_account_nominee_id"
    t.index ["account_number"], name: "index_deposit_accounts_on_account_number", unique: true
    t.index ["branch_id"], name: "index_deposit_accounts_on_branch_id"
    t.index ["customer_id"], name: "index_deposit_accounts_on_customer_id"
    t.index ["deposit_product_id"], name: "index_deposit_accounts_on_deposit_product_id"
    t.index ["installment_account_id"], name: "index_deposit_accounts_on_installment_account_id"
    t.index ["installment_frequency_id"], name: "index_deposit_accounts_on_installment_frequency_id"
    t.index ["interest_frequency_id"], name: "index_deposit_accounts_on_interest_frequency_id"
    t.index ["interest_nominee_id"], name: "index_deposit_accounts_on_interest_nominee_id"
  end

  create_table "deposit_interest_calc_types", force: :cascade do |t|
    t.string "type_name", null: false
    t.bigint "frequency_id", null: false
    t.boolean "status", default: true
    t.index ["frequency_id"], name: "index_deposit_interest_calc_types_on_frequency_id"
  end

  create_table "deposit_products", force: :cascade do |t|
    t.bigint "branch_id", null: false
    t.string "product_name", null: false
    t.string "product_name_np", null: false
    t.string "prefix"
    t.string "suffix"
    t.integer "acc_digit", null: false
    t.string "product_type", null: false
    t.integer "duration"
    t.decimal "minimum_balance"
    t.decimal "interest_rate", null: false
    t.integer "interest_posting_frequency_id", null: false
    t.integer "interest_calculation_type_id", null: false
    t.integer "tran_gl_id", null: false
    t.integer "interest_expenses_gl_id", null: false
    t.integer "interest_payable_gl_id", null: false
    t.integer "tax_gl_id", null: false
    t.decimal "tax_rate", default: "6.0", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id"
    t.index ["branch_id"], name: "index_deposit_products_on_branch_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "district_name", null: false
    t.bigint "province_id", null: false
    t.string "np_name", null: false
    t.string "copomis_code", null: false
    t.index ["province_id"], name: "index_districts_on_province_id"
  end

  create_table "frequencies", force: :cascade do |t|
    t.string "frequency_name", null: false
    t.string "frequency_code", null: false
    t.string "frequency_name_np", null: false
    t.string "schedule_freq_name", null: false
    t.string "schedule_frequency_code", null: false
  end

  create_table "kyc_addresses", force: :cascade do |t|
    t.bigint "kyc_personal_id", null: false
    t.string "address_type", null: false
    t.integer "province_id", null: false
    t.integer "district_id", null: false
    t.integer "mn_vdc_id", null: false
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

  create_table "master_ledgers", force: :cascade do |t|
    t.string "master_code", null: false
    t.string "account_name", null: false
    t.string "account_name_np", null: false
    t.string "account_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_name"], name: "index_master_ledgers_on_account_name", unique: true
    t.index ["account_name_np"], name: "index_master_ledgers_on_account_name_np", unique: true
    t.index ["master_code"], name: "index_master_ledgers_on_master_code", unique: true
  end

  create_table "mn_vdcs", force: :cascade do |t|
    t.bigint "district_id", null: false
    t.string "municipality_name", null: false
    t.string "municipality_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_mn_vdcs_on_district_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "province_name", null: false
    t.string "np_name", null: false
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
  add_foreign_key "deposit_accounts", "branches"
  add_foreign_key "deposit_accounts", "customers"
  add_foreign_key "deposit_accounts", "deposit_accounts", column: "account_nominee_id"
  add_foreign_key "deposit_accounts", "deposit_accounts", column: "installment_account_id"
  add_foreign_key "deposit_accounts", "deposit_accounts", column: "interest_nominee_id"
  add_foreign_key "deposit_accounts", "deposit_products"
  add_foreign_key "deposit_accounts", "frequencies", column: "installment_frequency_id"
  add_foreign_key "deposit_accounts", "frequencies", column: "interest_frequency_id"
  add_foreign_key "deposit_accounts", "users", column: "creator_id"
  add_foreign_key "deposit_accounts", "users", column: "last_update_by_id"
  add_foreign_key "deposit_interest_calc_types", "frequencies"
  add_foreign_key "deposit_products", "branches"
  add_foreign_key "deposit_products", "deposit_interest_calc_types", column: "interest_calculation_type_id"
  add_foreign_key "deposit_products", "frequencies", column: "interest_posting_frequency_id"
  add_foreign_key "deposit_products", "users", column: "creator_id"
  add_foreign_key "districts", "provinces"
  add_foreign_key "kyc_addresses", "districts"
  add_foreign_key "kyc_addresses", "kyc_personals"
  add_foreign_key "kyc_addresses", "mn_vdcs"
  add_foreign_key "kyc_addresses", "provinces"
  add_foreign_key "kyc_contacts", "kyc_personals"
  add_foreign_key "kyc_personals", "customers"
  add_foreign_key "mn_vdcs", "districts"
  add_foreign_key "users", "branches"
end
