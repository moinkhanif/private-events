class EventsController < ApplicationController
  before_action :login_required, only: %i[new create]
  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all.limit(10)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(name: params[:name], body: params[:body], date: params[:date])
    # @event.user_ids << current_user.id
    if @event.save
      redirect_to user_path(current_user.id)
    else
      redirect_to new_events_path
    end
  end
end
