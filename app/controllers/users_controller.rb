class UsersController < ApplicationController
  skip_before_action :login_required

  def index
    @user = current_user ? current_user.name : 'Guest'
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
    @user = User.find(params[:id])
    if @user
      @created_events = @user.events
      @user_past_events = @created_events.past_date
      @user_upcoming_events = @created_events.upcoming_date
      @user_invites = @user.invites
    else
      flash[:alert] = 'User does not exist!'
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
