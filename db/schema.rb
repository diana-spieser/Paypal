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

ActiveRecord::Schema[7.0].define(version: 2019_02_28_150942) do
  create_table "assignments", force: :cascade do |t|
    t.integer "color_id"
    t.integer "product_id"
    t.integer "quantity"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["color_id"], name: "index_assignments_on_color_id"
    t.index ["product_id"], name: "index_assignments_on_product_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "quantity"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "product_id"
    t.integer "order_id"
    t.decimal "total"
    t.decimal "unit_price"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "subtotal"
    t.decimal "total"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.decimal "price"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  add_foreign_key "assignments", "colors"
  add_foreign_key "assignments", "products"
end
