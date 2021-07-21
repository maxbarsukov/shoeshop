# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe ProductSerializer, type: :serializer do
  let!(:products) { create_list :product, 2 }
  let(:product)        { products.first }

  subject { ProductSerializer.new(product.reload) }

  it 'includes the expected attributes' do
    expect(subject.attributes.keys).
      to contain_exactly(
           :id,
           :title,
           :short_title,
           :bytitle,
           :content,
           :price,
           :old_price,
           :description,
           :hit,
           :status,
         )
  end
end
