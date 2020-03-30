class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  
    def after_sign_up_path_for(resource)
    user_path(resource)
    end

before_action :user_permitted_parameters, if: :devise_controller?

protected
  def user_permitted_parameters
    added_attrs = [:name]
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end