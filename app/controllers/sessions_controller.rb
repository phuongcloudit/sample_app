# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      user_activated user
    else
      flash.now[:danger] = t(".invalid")
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def user_activated user
    if user.activated?
      log_in user
      check_remember user
      redirect_back_or user
    else
      message = t(".not_activa")
      flash[:warning] = message
      redirect_to root_path
    end
  end
end
