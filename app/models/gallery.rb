# == Schema Information
#
# Table name: galleries
#
#  id         :bigint           not null, primary key
#  product_id :integer
#  img        :string
#
class Gallery < ApplicationRecord
  belongs_to :product
end
