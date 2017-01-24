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

ActiveRecord::Schema.define(version: 20_170_123_105_648) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'carts', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string   'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string   'ancestry'
  end

  create_table 'line_items', force: :cascade do |t|
    t.integer  'product_id'
    t.integer  'cart_id'
    t.datetime 'created_at',             null: false
    t.datetime 'updated_at',             null: false
    t.integer  'quantity', default: 1
    t.integer  'order_id'
    t.index ['cart_id'], name: 'index_line_items_on_cart_id', using: :btree
    t.index ['order_id'], name: 'index_line_items_on_order_id', using: :btree
    t.index ['product_id'], name: 'index_line_items_on_product_id', using: :btree
  end

  create_table 'orders', force: :cascade do |t|
    t.string   'name'
    t.text     'address'
    t.string   'email'
    t.integer  'pay_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'product_properties', force: :cascade do |t|
    t.string   'value'
    t.integer  'property_id'
    t.integer  'product_id'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.index ['product_id'], name: 'index_product_properties_on_product_id', using: :btree
    t.index ['property_id'], name: 'index_product_properties_on_property_id', using: :btree
  end

  create_table 'product_related', force: :cascade do |t|
    t.integer 'product_id'
    t.integer 'related_id'
    t.index %w(product_id related_id), name: 'index_product_related_on_product_id_and_related_id', unique: true, using: :btree
    t.index ['product_id'], name: 'index_product_related_on_product_id', using: :btree
    t.index ['related_id'], name: 'index_product_related_on_related_id', using: :btree
  end

  create_table 'products', force: :cascade do |t|
    t.string   'name'
    t.text     'description'
    t.decimal  'price', precision: 8, scale: 2
    t.datetime 'created_at',                                          null: false
    t.datetime 'updated_at',                                          null: false
    t.string   'image'
    t.string   'category_id'
    t.boolean  'sale', default: false
    t.decimal  'sale_price', precision: 8, scale: 2
  end

  create_table 'properties', force: :cascade do |t|
    t.string   'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'reviews', force: :cascade do |t|
    t.text     'review'
    t.integer  'product_id'
    t.string   'author_name'
    t.string   'author_email'
    t.boolean  'published', default: false
    t.integer  'rating'
    t.datetime 'created_at',                   null: false
    t.datetime 'updated_at',                   null: false
    t.index ['product_id'], name: 'index_reviews_on_product_id', using: :btree
  end

  add_foreign_key 'line_items', 'carts'
  add_foreign_key 'line_items', 'orders'
  add_foreign_key 'line_items', 'products'
  add_foreign_key 'product_properties', 'products'
  add_foreign_key 'product_properties', 'properties'
  add_foreign_key 'reviews', 'products'
end
