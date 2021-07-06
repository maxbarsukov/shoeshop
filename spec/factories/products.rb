# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    brand_id    { rand(1..5) }
    title       { Faker::Lorem.word.camelcase }
    bytitle     { title.downcase }
    img         { 'img.png' }
    content     { Faker::Lorem.sentence(word_count: 10) }
    keywords    { title.downcase }
    description { content }
    price       { rand(10..500) }
    old_price   { rand(10..500) }
    status      { 1 }
    hit         { 1 }
  end
end
