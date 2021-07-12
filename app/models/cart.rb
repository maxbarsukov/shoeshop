class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  validates :user_id, presence: true

  def total_quantity
    cart_items.map(&:quantity).sum
  end

  def total_price
    products.map(&:price).sum
  end
end
