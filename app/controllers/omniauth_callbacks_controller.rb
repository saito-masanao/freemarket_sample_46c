class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook; basic_action; end
  def google; basic_action; end

  private
  def basic_action
    @omniauth = request.env['omniauth.auth']
    if @omniauth.present?
      @profile = SocialProfile.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first

      if @profile
        @profile.set_values(@omniauth)
        sign_in_and_redirect @profile.user, event: :authentication
      else
          session[:nickname] = @omniauth['info']['name']
          session[:email] = @omniauth['info']['email']
          session[:password] = Devise.friendly_token[0, 20]
          session[:provider] = @omniauth['provider']
          session[:uid] = @omniauth['uid']
          redirect_to users_new_path
      end
    end
  end
end

