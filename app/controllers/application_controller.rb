class ApplicationController < ActionController::Base
  # [...]
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :about_me, :gender, :phone_number, :university, :year_of_study, :date_of_birth, :photo])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :about_me, :gender, :phone_number, :university, :year_of_study, :date_of_birth, :photo])
  end

  # setting up meta tags for our application
  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

end
