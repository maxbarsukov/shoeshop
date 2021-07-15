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
FactoryBot.define do
  factory :product do
    association :category, factory: :category

    brand_id    { rand(1..5) }
    title       { Faker::Lorem.word.camelcase }
    bytitle     { title.downcase }
    img         { 'p-1.png' }
    content     { Faker::Lorem.sentence(word_count: 10) }
    keywords    { title.downcase }
    description { content }
    price       { rand(10..500) }
    old_price   { rand(10..500) }
    status      { 1 }
    hit         { 1 }
  end
end
