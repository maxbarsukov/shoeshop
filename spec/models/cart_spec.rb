# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_carts_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should have_many(:cart_items) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id) }
  it { should have_many(:products) }
end
