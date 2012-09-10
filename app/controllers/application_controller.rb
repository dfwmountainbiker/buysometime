class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :current_client

  #this styles Devise using the web_app_theme gem layout
  config.to_prepare do
   Devise::SessionsController.layout "sign"
  end

  private

  def current_client
     @current_client ||= request.host
     #@current_client ||= Client.where(:host => request.host).first
     render('/public/404.html', :status => :not_found, :layout => false) unless @current_client
  end
 
  def after_sign_out_path_for(resource_or_scope)
    "http://www.modernmsg.com"
  end


end
