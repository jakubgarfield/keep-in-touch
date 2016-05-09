class User < ActiveRecord::Base
  devise :trackable, :omniauthable, omniauth_providers: [:google_oauth2]
end
