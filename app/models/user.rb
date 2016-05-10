class User < ActiveRecord::Base
  has_many :friends
  devise :trackable, :omniauthable, omniauth_providers: [:google_oauth2]
end
