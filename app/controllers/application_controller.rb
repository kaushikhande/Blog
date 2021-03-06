class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # Devise Stuff
  #before_filter :configure_permitted_parameters, if: :devise_controller?
  
   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :username) }
  end
  # End Devise Stuff
end
