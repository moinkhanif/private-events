class UsersController < ApplicationController
  skip_before_action :login_required

  def index
    current_user = User.where(session[:current_user_id]).first
    @user = current_user.name if current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if User.where(name: @user.name).empty?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Name exists! Please select a different name.'
      redirect_to signup_path
    end
  end

  def show
    if User.where(id: params[:id]).empty?
      flash[:alert] = 'User does not exist!'
      redirect_to signup_path
    else
      @user = User.find(params[:id])
      @events = @user.events
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
