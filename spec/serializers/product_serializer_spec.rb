# frozen_string_literal: true

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
