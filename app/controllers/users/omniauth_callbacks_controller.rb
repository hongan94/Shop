class Users::OmniauthCallbacksController < ApplicationController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/users.rb)
    @email = request.env["omniauth.auth"].info.email
    @name = request.env["omniauth.auth"].info.name
    @uid = request.env["omniauth.auth"].uid
    @password = Devise.friendly_token[0,8]
    @user = User.create(name: @name, email: @email, uid: @uid, password: @password)
    @user = User.find_by_uid(request.env["omniauth.auth"].uid)
      if @user.persisted?
        sign_in @user, :event => :authentication #this will throw if @users is not activated
        flash[:notice] = "Successfully" if is_navigational_format?
        redirect_to root_path
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end

  def show
  end

  def failure
    redirect_to root_path
  end
end
