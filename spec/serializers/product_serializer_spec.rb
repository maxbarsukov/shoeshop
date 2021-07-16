# frozen_string_literal: true

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
