class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :login_required, except: [:index]

  # This method checks if we have a user signed in
  def login_required
    unless logged_in?
      flash[:alert] = 'You need to login first!'
      redirect_to new_session_path
    end
  end

  def logged_in?
    !!current_user
  end

  helper_method :logged_in?

  # This method gives us details about our user
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @current_user
    else
      false
    end
  end

  helper_method :current_user

  def past_events(events)
    @past = events.past_date
  end

  helper_method :past_events

  def upcoming_events(events)
    @upcoming = events.upcoming_date
  end

  helper_method :upcoming_events
end
