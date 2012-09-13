class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

      
end