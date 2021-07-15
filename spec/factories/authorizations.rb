# frozen_string_literal: true

# == Schema Information
#
# Table name: authorizations
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  provider   :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :authorization do
  end
end
