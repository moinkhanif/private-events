class EventsController < ApplicationController
  before_action :login_required, only: [:new,:create]
  def show
    @event = Event.find(params[:id])
  end
  def index
    @events = Event.all
  end
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    @event.user_ids << current_user.id
    if @event.save
      @user = @event.user_ids
      redirect_to user_path(@user)
    else
      redirect_to new_events_path
    end
  end

  def event_params
    params.require(:event)
  end
end
