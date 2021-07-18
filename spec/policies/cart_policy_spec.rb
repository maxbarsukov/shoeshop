# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartPolicy, type: :policy do
  let(:user)    { create :user }
  let(:product) { create :product }
  let(:cart)    { create :cart, user: user }
  let(:item)    { create :cart_item, cart: cart, product: product }
  let(:scope)   { Pundit.policy_scope!(user, Cart) }

  subject { described_class }

  permissions :show? do
    context 'for auth user' do
      it 'grants to show cart' do
        expect(subject).to permit(user)
      end
    end

    context 'for a visitor' do
      let(:user) { nil }
      it { should_not permit(user) }
    end
  end

  permissions :destroy? do
    let(:user) { nil }
    it { should_not permit(user) }
  end

  describe 'Scope' do
    context 'client user' do
      it 'allows access to all the reports' do
        expect(scope).to eq []
      end
    end

    context 'admin user' do
      let(:user) { User.new(admin: true) }

      it 'allows access to all the reports' do
        expect(scope).to eq []
      end
    end

    context 'visitor' do
      let(:user) { nil }

      it 'allows access to all the reports' do
        expect(scope).to eq []
      end
    end
  end
end
