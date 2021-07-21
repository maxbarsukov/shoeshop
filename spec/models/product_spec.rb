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

RSpec.describe Product, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :price }

  it { should belong_to(:category) }
  it { should belong_to(:brand) }

  it { should have_many(:galleries) }

  it { should have_many(:related_products) }
  it { should have_many(:related) }
end
