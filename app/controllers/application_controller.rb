class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    user_account_pages_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password,:balance  ) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation,
                                                            :current_password,:balance, :account_type,

                                                            :first_name, :last_name,:website,:street,
                                                            :city, :state,:occupation, :business_name, :business_info,
                                                            :business_address, :business_website,
                                                            :contact_first_name,:contact_last_name, :title) }
    
  end
end
