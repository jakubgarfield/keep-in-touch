class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include ApplicationHelper

  def google_oauth2
    email = request.env["omniauth.auth"][:info][:email]
    uid = request.env["omniauth.auth"][:uid]
    provider = request.env["omniauth.auth"][:provider]

    user = User.find_by(email: email)
    if user.nil?
      @user = User.create!(email: email, provider: provider, uid: uid)
    elsif user.provider == provider && user.uid == uid
      @user = user
    else
      flash[:error] = "Email #{email} is already registered by #{omniauth_provider_name(user.provider.to_sym)} authentication."
      return redirect_to  new_user_session_url
    end

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    end
  end
end
