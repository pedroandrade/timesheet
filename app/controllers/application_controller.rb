class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: ['home#index', 'users#sign_in', 'users#sign_up']
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    time_entries_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [ :username, :display_name ]
    devise_parameter_sanitizer.for(:account_update) << [ :username, :display_name ]
  end
end
