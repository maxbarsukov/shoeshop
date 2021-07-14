module UserOauth
  extend ActiveSupport::Concern

  def create_authorization(auth)
    authorizations.create(provider: auth.provider, uid: auth.uid)
  end

  class_methods do
    def find_for_oauth(auth)
      authorizations = Authorization
                       .where(provider: auth.provider, uid: auth.uid)
                       .first

      return authorizations.user if authorizations

      email = auth.info[:email]
      user = User.where(email: email).first

      email ||= create_email(auth) if email.nil?

      unless user
        password = Devise.friendly_token [0, 20]
        user = user.create!(email: email,
                            password: password,
                            password_confirmation: password)
      end
      user.create_authorization(auth)
    end

    def create_email(auth)
      "#{auth[:uid]}@shoeshop.com"
    end
  end
end
