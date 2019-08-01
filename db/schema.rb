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

ActiveRecord::Schema.define(version: 2019_08_01_221918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "department_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_cities_on_department_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "cuit"
    t.string "habilitation"
    t.integer "beds_voluntary"
    t.integer "beds_judicial"
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

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_departments_on_state_id"
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
    t.bigint "city_id", null: false
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_patients_on_city_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
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

  add_foreign_key "cities", "departments"
  add_foreign_key "contacts", "patients"
  add_foreign_key "departments", "states"
  add_foreign_key "internments", "patients"
  add_foreign_key "patients", "cities"
  add_foreign_key "users", "clinics"
end
