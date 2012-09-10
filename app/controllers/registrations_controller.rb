class RegistrationsController < Devise::RegistrationsController
  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      # apply omniauth calls the user model and applies omniauth session to the info
      @user.apply_omniauth(session[:omniauth])

      #
      @user.valid?
    end
  end
end

