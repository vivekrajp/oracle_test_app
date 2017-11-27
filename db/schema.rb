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

ActiveRecord::Schema.define(version: 20171101143135) do

  create_table "contact_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "contact_id"
    t.string "address_type"
    t.text "address"
    t.datetime "deleted_at"
    t.index ["contact_id"], name: "index_contact_addresses_on_contact_id"
    t.index ["deleted_at"], name: "index_contact_addresses_on_deleted_at"
  end

  create_table "contact_phone_numbers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "contact_id"
    t.string "phone_type"
    t.string "number"
    t.datetime "deleted_at"
    t.index ["contact_id"], name: "index_contact_phone_numbers_on_contact_id"
    t.index ["deleted_at"], name: "index_contact_phone_numbers_on_deleted_at"
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_contacts_on_deleted_at"
  end

  add_foreign_key "contact_addresses", "contacts"
  add_foreign_key "contact_phone_numbers", "contacts"
end
