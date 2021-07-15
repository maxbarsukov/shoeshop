# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  title       :string
#  bytitle     :string
#  keywords    :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  ancestry    :string
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:products) }
end
