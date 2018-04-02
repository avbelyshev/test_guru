class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def default_url_options
    { lang: I18n.locale }
  end

  private

  def record_not_found
    render plain: '404. Resource was not found', status: 404
  end

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : super
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name name])
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
