# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper

  private

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t(".please_login")
    redirect_to login_path
  end
end
