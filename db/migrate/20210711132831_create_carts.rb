class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      add_reference :carts, :user, index: true
      t.timestamps
    end
  end
end
