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
