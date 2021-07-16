class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :cart_items, :cart_id
    add_index :cart_items, :product_id

    add_index :galleries, :product_id

    add_index :products, :category_id
    add_index :products, :brand_id

    add_index :related_products, :product_id
    add_index :related_products, :related_id
  end
end
