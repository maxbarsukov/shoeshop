# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should have_one(:cart) }
  it { should have_many(:authorizations) }

  describe '.find_for_auth' do
    let!(:user) { create(:user) }
    let(:create_params) { { provider: 'facebook', uid: '123456' } }
    let(:auth) { OmniAuth::AuthHash.new(create_params) }

    context 'user already has auth' do
      it 'returns the user' do
        user.authorizations.create(create_params)
        expect(User.find_for_oauth(auth)).to eq(user)
      end
    end

    context 'user has not auth' do
      let(:auth) { OmniAuth::AuthHash.new(
        provider: 'facebook',
        uid: '123456',
        info: { email: email }
      )}

      let(:email) { user.email }

      context 'user already exists' do
        it 'does not create user' do
          expect(User.find_for_oauth(auth)).to match(user)
        end

        it 'create authorization for user' do
          expect { User.find_for_oauth(auth) }
            .to change(user.authorizations, :count).by(1)
        end

        it 'creates authorization with provider and uid' do
          authorization = User.find_for_oauth(auth).authorizations.first
          expect(authorization.provider).to eq(auth.provider)
          expect(authorization.uid).to eq(auth.uid)
        end

        it 'return the user' do
          expect(User.find_for_oauth(auth)).to eq(user)
        end
      end

      context 'user does not exist' do
        let(:email) { 'wrong@email.email' }

        it 'creates new user' do
          expect { User.find_for_oauth(auth) }
            .to change(User, :count).by(1)
        end

        it 'return new user' do
          expect(User.find_for_oauth(auth)).to be_a(User)
        end

        it 'fill user email' do
          user = User.find_for_oauth(auth)
          expect(user.email).to eq auth.info[:email]
        end

        it 'creates authorization for user' do
          user = User.find_for_oauth(auth)
          expect(user.authorizations).to_not be_empty
        end

        it 'creates authorization with provider and uid' do
          authorization = User.find_for_oauth(auth).authorizations.first
          expect(authorization.provider).to eq(auth.provider)
          expect(authorization.uid).to eq(auth.uid)
        end
      end
    end
  end
end
