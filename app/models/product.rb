# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  category_id :integer
#  brand_id    :integer
#  title       :string
#  bytitle     :string
#  content     :text
#  price       :float
#  old_price   :float
#  status      :integer
#  keywords    :string
#  description :string
#  img         :string           default("no_image.jpg")
#  hit         :integer          default("not_hit")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
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
