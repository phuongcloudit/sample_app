# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy
  before_action :load_user, only: %i(edit update destroy)
  def show
    load_user
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t(".please_check_mail")
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t(".profile_updated")
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t(".user_delete")
      redirect_to users_path
    else
      flash[:warning] = t ".delete_err"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t(".please_login")
    redirect_to login_path
  end

  def correct_user
    load_user
    redirect_to(root_path) unless @user == current_user
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
