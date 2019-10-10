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

ActiveRecord::Schema.define(version: 2019_10_09_155117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "analyse_elements", force: :cascade do |t|
    t.bigint "analysis_id"
    t.string "name"
    t.string "normal_value"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analysis_id"], name: "index_analyse_elements_on_analysis_id"
  end

  create_table "analyse_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "analyses", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "normal_value"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_analyses_on_user_id"
  end

  create_table "arrival_mails", force: :cascade do |t|
    t.datetime "arrival_date"
    t.string "origin"
    t.string "reference"
    t.datetime "mail_date"
    t.string "recipient"
    t.string "nature"
    t.string "object"
    t.string "reserved_suite"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_arrival_mails_on_user_id"
  end

  create_table "ethnic_groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ethnic_groups_on_user_id"
  end

  create_table "imputations", force: :cascade do |t|
    t.bigint "arrival_mail_id"
    t.bigint "service_id"
    t.bigint "agent_id"
    t.text "reason"
    t.text "opinion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_imputations_on_agent_id"
    t.index ["arrival_mail_id"], name: "index_imputations_on_arrival_mail_id"
    t.index ["service_id"], name: "index_imputations_on_service_id"
  end

  create_table "input_stock_entries", force: :cascade do |t|
    t.bigint "input_type_id"
    t.bigint "input_id"
    t.string "reason"
    t.bigint "provider_id"
    t.integer "quantity"
    t.string "unit"
    t.string "delivery_number"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["input_id"], name: "index_input_stock_entries_on_input_id"
    t.index ["input_type_id"], name: "index_input_stock_entries_on_input_type_id"
    t.index ["provider_id"], name: "index_input_stock_entries_on_provider_id"
    t.index ["user_id"], name: "index_input_stock_entries_on_user_id"
  end

  create_table "input_stock_outlets", force: :cascade do |t|
    t.bigint "input_type_id"
    t.bigint "input_id"
    t.string "reason"
    t.integer "quantity"
    t.string "unit"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["input_id"], name: "index_input_stock_outlets_on_input_id"
    t.index ["input_type_id"], name: "index_input_stock_outlets_on_input_type_id"
    t.index ["user_id"], name: "index_input_stock_outlets_on_user_id"
  end

  create_table "input_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_input_types_on_user_id"
  end

  create_table "inputs", force: :cascade do |t|
    t.bigint "input_type_id"
    t.string "name"
    t.date "manufacture_date"
    t.date "expiration_date"
    t.string "batch_number"
    t.string "cip"
    t.string "manufacturer"
    t.integer "alert_level"
    t.string "shelf_number"
    t.integer "current_stock"
    t.string "status"
    t.bigint "provider_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["input_type_id"], name: "index_inputs_on_input_type_id"
    t.index ["provider_id"], name: "index_inputs_on_provider_id"
    t.index ["user_id"], name: "index_inputs_on_user_id"
  end

  create_table "insurances", force: :cascade do |t|
    t.string "name"
    t.string "limited"
    t.bigint "limit_age"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_insurances_on_user_id"
  end

  create_table "localities", force: :cascade do |t|
    t.string "region"
    t.string "cercle"
    t.string "commune"
    t.string "village"
    t.string "neighbourhood"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_localities_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "slogan"
    t.string "director"
    t.string "address"
    t.string "phone"
    t.string "po_box"
    t.string "city"
    t.string "country"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "identifier"
    t.string "first_name"
    t.string "last_name"
    t.datetime "birth_date"
    t.string "gender"
    t.bigint "ethnic_group_id"
    t.string "born_place"
    t.string "profession"
    t.string "tutor"
    t.bigint "locality_id"
    t.string "address"
    t.string "phone"
    t.string "father_first_name"
    t.string "mother_first_name"
    t.string "mother_last_name"
    t.string "insured"
    t.string "dependent"
    t.string "dependent_person_name"
    t.bigint "insurance_id"
    t.datetime "insurance_start_date"
    t.datetime "insurance_end_date"
    t.string "insurance_identifier"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ethnic_group_id"], name: "index_patients_on_ethnic_group_id"
    t.index ["locality_id"], name: "index_patients_on_locality_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "phone"
    t.string "specialty_one"
    t.bigint "user_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "company"
    t.string "contact_name"
    t.string "address"
    t.string "phone"
    t.string "city"
    t.string "country"
    t.string "email"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_providers_on_user_id"
  end

  create_table "receipt_analyses", force: :cascade do |t|
    t.bigint "receipt_id"
    t.bigint "analysis_id"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analysis_id"], name: "index_receipt_analyses_on_analysis_id"
    t.index ["receipt_id"], name: "index_receipt_analyses_on_receipt_id"
    t.index ["user_id"], name: "index_receipt_analyses_on_user_id"
  end

  create_table "receipt_items", force: :cascade do |t|
    t.bigint "receipt_id"
    t.bigint "analysis_id"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analysis_id"], name: "index_receipt_items_on_analysis_id"
    t.index ["receipt_id"], name: "index_receipt_items_on_receipt_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.bigint "patient_id"
    t.float "insurance_amount", default: 0.0
    t.float "total_amount", default: 0.0
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_receipts_on_patient_id"
    t.index ["user_id"], name: "index_receipts_on_user_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "receipt_id"
    t.bigint "user_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receipt_id"], name: "index_results_on_receipt_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "permission_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sample_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "samples", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "sample_type_id"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_samples_on_patient_id"
    t.index ["sample_type_id"], name: "index_samples_on_sample_type_id"
    t.index ["user_id"], name: "index_samples_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.bigint "role_id"
    t.bigint "service_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["service_id"], name: "index_users_on_service_id"
  end

  create_table "waiting_lists", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "receipt_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_waiting_lists_on_patient_id"
    t.index ["receipt_id"], name: "index_waiting_lists_on_receipt_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "analyse_elements", "analyses"
  add_foreign_key "analyses", "users"
  add_foreign_key "arrival_mails", "users"
  add_foreign_key "ethnic_groups", "users"
  add_foreign_key "imputations", "arrival_mails"
  add_foreign_key "imputations", "services"
  add_foreign_key "input_stock_entries", "input_types"
  add_foreign_key "input_stock_entries", "inputs"
  add_foreign_key "input_stock_entries", "providers"
  add_foreign_key "input_stock_entries", "users"
  add_foreign_key "input_stock_outlets", "input_types"
  add_foreign_key "input_stock_outlets", "inputs"
  add_foreign_key "input_stock_outlets", "users"
  add_foreign_key "input_types", "users"
  add_foreign_key "inputs", "input_types"
  add_foreign_key "inputs", "providers"
  add_foreign_key "inputs", "users"
  add_foreign_key "insurances", "users"
  add_foreign_key "localities", "users"
  add_foreign_key "patients", "ethnic_groups"
  add_foreign_key "patients", "localities"
  add_foreign_key "patients", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "providers", "users"
  add_foreign_key "receipt_analyses", "analyses"
  add_foreign_key "receipt_analyses", "receipts"
  add_foreign_key "receipt_analyses", "users"
  add_foreign_key "receipt_items", "analyses"
  add_foreign_key "receipt_items", "receipts"
  add_foreign_key "receipts", "patients"
  add_foreign_key "receipts", "users"
  add_foreign_key "results", "receipts"
  add_foreign_key "results", "users"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "samples", "patients"
  add_foreign_key "samples", "sample_types"
  add_foreign_key "samples", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "users", "services"
  add_foreign_key "waiting_lists", "patients"
  add_foreign_key "waiting_lists", "receipts"
end
