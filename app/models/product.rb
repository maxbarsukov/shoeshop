class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true

  belongs_to :category

  has_many :related_products
  has_many :related, through: :related_products

  has_many :galleries

  enum hit: { hit: 1, not_hit: 0 }

  def discount
    (100 - (price * 100 / old_price)).round
  end
end
