# == Schema Information
#
# Table name: galleries
#
#  id         :bigint           not null, primary key
#  img        :string
#  product_id :integer
#
# Indexes
#
#  index_galleries_on_product_id  (product_id)
#
class Gallery < ApplicationRecord
  belongs_to :product
end
