# == Schema Information
#
# Table name: related_products
#
#  id         :bigint           not null, primary key
#  product_id :integer
#  related_id :integer
#
class RelatedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :related, class_name: 'Product'
end
