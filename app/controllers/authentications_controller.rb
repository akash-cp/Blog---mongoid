class AuthenticationsController < ApplicationController

  def create
    params =  request.env['omniauth.params']#.to_yaml
    name = params["name"]
# byebug

    if name == "su"

      super_user =  SuperUser.from_omniauth(request.env['omniauth.auth'])
      if super_user.persisted?
        sign_in(super_user)
        redirect_to admins_path
        # sign_in_and_redirect user, notice: 'Signed In!'
      else
        session['devise.user_attributes'] = super_user.attributes
        redirect_to new_super_user_registration_url
      end
    end


    if name == "user"
      user =  User.from_omniauth(request.env['omniauth.auth'])
      if user.persisted?
        sign_in(user)
        redirect_to welcomes_path
        # sign_in_and_redirect user,   notice: 'Signed In!'

      else
        session['devise.user_attributes'] = user.attributes
        redirect_to new_user_registration_url
      end


    end

  end

end