class SessionsController < ApplicationController
  skip_before_action :login_required, except: [:create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by_name(params[:name])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = “Invalid name”
      render “new”
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def login(user)
      session[:user_id] = nil
    end
end
