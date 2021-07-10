class CreateRelatedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :related_products do |t|
      t.integer :product_id
      t.integer :related_id
      t.timestamps
    end
  end
end
