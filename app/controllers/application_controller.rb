class ApplicationController < ActionController::Base
  # [...]
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :about_me, :gender, :phone_number, :university, :year_of_study, :date_of_birth])
  end

end
