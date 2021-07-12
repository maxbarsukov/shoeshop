# frozen_string_literal: true

FactoryBot.define do
  factory :cart_item do
    association :product, factory: :product
    association :cart,    factory: :cart

    quantity { 1 }
  end
end
