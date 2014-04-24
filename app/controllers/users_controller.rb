class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "User successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def signed_in_user 
      redirect_to signin_path, notice: "Please, sign in" unless signed_in?
    end

    def correct_user
      redirect_to root_path, error: 'Access denied' unless current_user?(@user)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params
        .require(:user)
        .permit(:name, 
                :email,
                :password,
                :password_confirmation)
    end

end
