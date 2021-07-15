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
FactoryBot.define do
  factory :category do
    title       { 'Men' }
    bytitle     { 'men' }
    keywords    { Faker::Lorem.sentence(word_count: 10) }
    description { Faker::Lorem.sentence(word_count: 10) }
  end
end
