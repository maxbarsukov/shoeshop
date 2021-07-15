# frozen_string_literal: true

# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  cart_id    :integer
#  product_id :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it { should belong_to(:product) }
  it { should belong_to(:cart) }
  it { should validate_presence_of(:cart_id) }
  it { should validate_presence_of(:quantity) }
end
