class AuthenticationController < ApplicationController

def to_key
   new_record? ? nil : [ self.send(self.class.primary_key) ]
end


def persisted?
  false
end 

  def index
    @authentications = current_user.authentication if current_user 
  end
  
 def create
  omniauth = request.env["omniauth.auth"]
  #logger.debug "***** The value of results is #{omniauth.inspect}  *******"
  authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
  if authentication
    flash[:notice] = "Signed in successfully."
    #sign_in_and_redirect(:user, authentication.user)
    sign_in(:user, authentication.user)
    redirect_to home_index_url
    #redirect_to me_url
  elsif current_user
    current_user.authentication.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
    flash[:notice] = "Authentication successful."
    #redirect_to authentications_url
    #redirect_to me_url
    redirect_to home_index_url
  else
    user = User.new
    user.apply_omniauth(omniauth)
    if user.save
      #flash[:notice] = "Signed in successfully."
      #sign_in_and_redirect(:user, user) 
    sign_in(:user, user)
    redirect_to home_index_url
    else
      session[:omniauth] = omniauth.except('extra')
      redirect_to new_user_registration_url
    end
  end
end
 
  def destroy
    @authentication = current_user.authentication.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to "/indexnew.html"
  end
end

