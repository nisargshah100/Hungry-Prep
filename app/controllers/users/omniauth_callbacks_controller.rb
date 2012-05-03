require 'open-uri'

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    data = request.env["omniauth.auth"]
    token = data['credentials']['token']
    email = JSON.parse(open("https://api.github.com/user/emails?access_token=#{token}").read()).first
    
    @user = User.find_for_github_oauth(email, data)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "GitHub"
      sign_in_and_redirect @user, :event => :authentication
    else
      redirect_to root_url, :notice => 'An error has occurred. Please contact hungryacademy@livingsocial.com'
    end
  end
end
