class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_one :cart, dependent: :destroy
  has_many :authorizations

  validates :email,    presence: true
  validates :password, presence: true
end
