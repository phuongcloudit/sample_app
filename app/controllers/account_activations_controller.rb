# frozen_string_literal: true

class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    check_acc_activated user
  end

  private

  def check_acc_activated user
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = t(".acc_activated")
      redirect_to user
    else
      flash[:danger] = t(".invalid_link")
      redirect_to root_path
    end
  end
end
