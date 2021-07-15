# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductPolicy, type: :policy do
  let(:user)  { create :user }
  let(:admin) { create :user, admin: true }

  subject { described_class }

  permissions :show? do
    context 'for auth user' do
      it 'grants access if user admin' do
        expect(subject).to permit(user)
      end

      it 'grants access if user present' do
        expect(subject).to permit(admin)
      end
    end

    context 'for a visitor' do
      let(:user) { nil }
      it { should_not permit(user) }
    end
  end
end
