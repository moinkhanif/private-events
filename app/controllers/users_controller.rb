class UsersController < ApplicationController
  skip_before_action :login_required

  def index
    current_user = User.where(session[:current_user_id]).first
    @user = current_user.name 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
