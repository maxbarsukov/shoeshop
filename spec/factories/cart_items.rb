# frozen_string_literal: true

# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer
#  product_id :integer
#
# Indexes
#
#  index_cart_items_on_cart_id     (cart_id)
#  index_cart_items_on_product_id  (product_id)
#
FactoryBot.define do
  factory :cart_item do
    association :product, factory: :product
    association :cart,    factory: :cart

    quantity { 1 }
  end
end
