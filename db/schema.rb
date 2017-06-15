ActiveRecord::Schema.define(version: 20170615055222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "floorplans", force: :cascade do |t|
    t.integer  "top"
    t.integer  "left"
    t.integer  "height"
    t.integer  "width"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "background"
    t.integer  "element_id"
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
