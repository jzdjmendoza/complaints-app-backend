class ApplicationController < ActionController::Base   
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :middle_name,
                                      :email, :city, :barangay, :contact_number, :type])
  end
end
