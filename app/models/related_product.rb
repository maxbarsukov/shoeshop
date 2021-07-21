# == Schema Information
#
# Table name: related_products
#
#  id         :bigint           not null, primary key
#  product_id :integer
#  related_id :integer
#
# Indexes
#
#  index_related_products_on_product_id  (product_id)
#  index_related_products_on_related_id  (related_id)
#
class RelatedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :related, class_name: 'Product'
end
