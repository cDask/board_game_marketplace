class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:role_id, :email, :password, :password_confirmation)
    end
  end

  def after_sign_up_path_for(_resource)
    new_profile_path
  end
end
