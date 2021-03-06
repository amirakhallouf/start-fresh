class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


#  before_action :authenticate_user!
 # before_action :authenticate_company!
 before_action :configure_permitted_parameters, if: :devise_controller?

 def default_url_options
   { host: ENV["www.dotaccess.space"] || "localhost:3000" }
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :location, :bio, :picture, :nationality, :skills, :education])
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :location, :bio, :picture, :nationality, :skills, :education,:tag_line, :video_url])
  end
end
