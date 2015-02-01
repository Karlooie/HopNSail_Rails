class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :authenticate_browser


  protected

  def authenticate_browser
    if (Rails.env.production? and request.fullpath != "/coming-coon" and request.fullpath != "/")
      authenticate_or_request_with_http_basic do |username, password|
        username == "karlooie" && password == "caccacacca"
      end
    end
  end

  def permitted_params
    @permitted_params ||= PermittedParams.new(params, current_user)
  end


  # Needed to handle strong params for custom fields in devise and rails 4
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation )
    end
 
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:first_name, :last_name, :email, :current_password, :password, :password_confirmation )
    end
  end

end
