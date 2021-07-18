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

RSpec.describe Product, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :price }

  it { should belong_to(:category) }
  it { should belong_to(:brand) }

  it { should have_many(:galleries) }

  it { should have_many(:related_products) }
  it { should have_many(:related) }
end
