class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :null_session
    # respond_to :html, :json
  
    def after_sign_in_path_for(resource) 
      if current_user.admin?
        admins_path
      else 
        books_path
      end 
    end

    def require_user
      if !user_signed_in?
        flash[:alert] = "You must be logged in!"
        redirect_to new_user_session_path
      end
    end

    def require_admin
      if !current_user.admin?
        flash[:alert] = "You have not authorization to access"
        redirect_to books_path
      end
    end
    
    protected
    
    def configure_permitted_parameters
      added_attrs = [:name, :email, :avatar, :contactnumber, :password, :password_confirmation]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs

    end 
end