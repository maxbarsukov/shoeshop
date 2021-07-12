# frozen_string_literal: true

FactoryBot.define do
  factory :cart do
    association :user, factory: :user
  end
end
