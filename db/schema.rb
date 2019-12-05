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

ActiveRecord::Schema.define(version: 2019_09_20_193309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "cuit"
    t.string "habilitation"
    t.integer "beds_voluntary"
    t.integer "beds_judicial"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "configs", force: :cascade do |t|
    t.json "checklist"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "lastname"
    t.string "firstname"
    t.string "document_type"
    t.string "document_number"
    t.string "relationship"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_contacts_on_patient_id"
  end

  create_table "internments", force: :cascade do |t|
    t.date "begin_date"
    t.string "type"
    t.date "end_date"
    t.bigint "patient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_internments_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "lastname"
    t.string "firstname"
    t.string "document_type"
    t.string "document_number"
    t.string "gender"
    t.date "birth_date"
    t.string "address"
    t.string "department"
    t.string "state"
    t.string "city"
    t.string "postal_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "clinic_id"
    t.text "medical_record"
    t.index ["clinic_id"], name: "index_patients_on_clinic_id"
  end

  create_table "report_definitions", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "period_type"
    t.integer "period_quantity"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "role"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "clinic_id"
    t.index ["clinic_id"], name: "index_users_on_clinic_id"
  end

  add_foreign_key "contacts", "patients"
  add_foreign_key "internments", "patients"
  add_foreign_key "patients", "clinics"
  add_foreign_key "users", "clinics"
end
