class AddUserReferenceToCarts < ActiveRecord::Migration[5.2]
  def change
    add_reference :carts, :user, index: true
  end
end
