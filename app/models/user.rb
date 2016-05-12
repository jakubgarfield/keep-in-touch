class User < ActiveRecord::Base
  has_many :friends, dependent: :destroy
  has_many :catchups, through: :friends
  devise :trackable, :omniauthable, omniauth_providers: [:google_oauth2]
end
