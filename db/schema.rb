

ActiveRecord::Schema.define(version: 20170613073901) do

  enable_extension "plpgsql"

  create_table "floorplans", force: :cascade do |t|
    t.integer  "top"
    t.integer  "left"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "operators", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "image"
    t.string   "email"
    t.text     "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "image"
    t.integer  "operator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
