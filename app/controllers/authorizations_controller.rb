class AuthorizationsController < ApplicationController
  def facebook
    @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)

    logger.debug "USEER: " + @user.inspect

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
