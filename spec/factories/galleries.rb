# frozen_string_literal: true

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
FactoryBot.define do
  factory :gallery do
  end
end
