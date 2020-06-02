class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
    @user = User.new
  end

  def create
    @user = User.where(name: params[:name]).first
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = 'Invalid name!'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def login(_user)
    session[:user_id] = nil
  end
end
