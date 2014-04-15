class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_out_path_for(resource_or_scope)
    "/users/sign_in"
  end
  def after_sign_in_path_for(resource)
    unless resource.profile_id
      "/profiles/new"
    else
      "/profiles/#{resource.profile_id}"
    end

    before_filter :set_user_language

    private

    def set_user_language
      i18n.locale = current_user.language if logged_in?
  end

end
