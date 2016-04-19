class SuperUserAuthenticationsController < ApplicationController

  def create
    user =  SuperUser.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?
      sign_in_and_redirect user, notice: 'Signed In!'
    else
      session['devise.user_attributes'] = user.attributes
      redirect_to new_user_registration_url
    end
  end

end