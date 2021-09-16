class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation,  :user_type)}

  end
  def after_sign_in_path_for(resource)

    case current_user.user_type
    when 'Developer'
      developer_path
    when 'Manager'
      user_projects_path
    else
      # type code here
    end

  end

end
