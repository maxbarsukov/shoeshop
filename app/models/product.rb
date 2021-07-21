# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  bytitle     :string
#  content     :text
#  description :string
#  hit         :integer          default("not_hit")
#  img         :string           default("no_image.jpg")
#  keywords    :string
#  old_price   :float
#  price       :float
#  status      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  brand_id    :integer
#  category_id :integer
#
# Indexes
#
#  index_products_on_brand_id     (brand_id)
#  index_products_on_category_id  (category_id)
#
class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true

  belongs_to :category
  belongs_to :brand

  has_many :related_products
  has_many :related, through: :related_products

  has_many :galleries

  enum hit: { hit: 1, not_hit: 0 }
  scope :active, -> { where(status: 1) }

  def discount
    (100 - (price * 100 / old_price)).round
  end
end
