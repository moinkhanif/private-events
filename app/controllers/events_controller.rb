class EventsController < ApplicationController
  before_action :login_required, only: %i[new create]
  def show
    @event = Event.find(params[:id])
    @event_creator = Event.creator(@event)
  end

  def index
    @events = Event.all.limit(10)
    @upcoming_events = @events.upcoming_date
    @past_events = @events.past_date
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to user_path(current_user.id)
    else
      redirect_to new_events_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :body, :date)
  end
end
