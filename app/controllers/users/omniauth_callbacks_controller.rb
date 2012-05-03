require 'open-uri'

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    data = request.env["omniauth.auth"]
    token = data['credentials']['token']
    email = JSON.parse(open("https://api.github.com/user/emails?access_token=#{token}").read()).first
    
    @user = User.find_for_github_oauth(email, data, current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "GitHub"
      sign_in_and_redirect @user, :event => :authentication
    else
      redirect_to root_url, :notice => 'An error has occurred. Please contact hungryacademy@livingsocial.com'
    end
  end

  def google
    data = request.env["omniauth.auth"]
    email = data['info']['email']
    
    @user = User.find_for_open_id(data, current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end
