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

ActiveRecord::Schema.define(version: 2018_08_08_040617) do

  create_table "api_keys", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_responses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "orderid"
    t.string "response"
    t.string "responsetext"
    t.string "authcode"
    t.string "transactionid"
    t.string "avsresponse"
    t.string "cvvresponse"
    t.string "type"
    t.string "response_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "order_id", null: false
    t.string "ccNumber", null: false
    t.string "ccMonth", null: false
    t.string "ccYear", null: false
    t.string "cvv", null: false
    t.string "billingAddress"
    t.string "description"
    t.string "email"
    t.float "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
  end

end
