ActiveRecord::Schema.define(version: 2021_07_06_142956) do
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "title"
    t.string "bytitle"
    t.string "img"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "category_id"
    t.integer "brand_id"
    t.string "title"
    t.string "bytitle"
    t.text "content"
    t.float "price"
    t.float "old_price"
    t.integer "status"
    t.string "keywords"
    t.string "description"
    t.string "img", default: "no_image.jpg"
    t.integer "hit", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
