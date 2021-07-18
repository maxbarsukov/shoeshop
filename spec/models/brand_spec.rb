# frozen_string_literal: true

# == Schema Information
#
# Table name: brands
#
#  id          :bigint           not null, primary key
#  title       :string
#  bytitle     :string
#  img         :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Brand, type: :model do
  it { should have_many(:products) }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
end
