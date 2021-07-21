# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  ancestry    :string
#  bytitle     :string
#  description :string
#  keywords    :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_categories_on_ancestry  (ancestry)
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:products) }
end
