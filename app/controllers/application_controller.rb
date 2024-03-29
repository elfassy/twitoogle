class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || (request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first rescue I18n.default_locale)
  end

end
