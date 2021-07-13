class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  validates :user_id, presence: true

  def empty?
    cart_items.none?
  end

  def total_quantity
    cart_items.sum(&:quantity)
  end

  def total_price
    return 0 if cart_items.none?

    cart_items.joins(:product)
              .select('(cart_items.quantity * products.price) as total')
              .sum(&:total)
  end
end
