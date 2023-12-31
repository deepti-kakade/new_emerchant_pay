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

ActiveRecord::Schema[7.0].define(version: 2023_07_01_111929) do
  create_table "transactions", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "customer_email", null: false
    t.string "customer_phone", null: false
    t.decimal "amount", precision: 20, scale: 2, default: "0.0"
    t.integer "status", default: 0, null: false
    t.string "type"
    t.integer "merchant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_transactions_on_merchant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.decimal "total_transaction_sum", precision: 20, scale: 2, default: "0.0"
    t.integer "status", default: 0, null: false
    t.string "type"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["status"], name: "index_users_on_status"
  end

  add_foreign_key "transactions", "users", column: "merchant_id"
end
