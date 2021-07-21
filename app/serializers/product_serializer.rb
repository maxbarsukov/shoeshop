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
class ProductSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :short_title,
             :bytitle,
             :content,
             :price,
             :old_price,
             :description,
             :hit,
             :status

  belongs_to :category
  has_many :related, through: :related_products

  def short_title
    object.title.truncate(8)
  end
end
