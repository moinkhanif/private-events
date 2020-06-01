module EventsHelper
  def past_events_action
    if @past_events.size > 0
      @past_events.each do |event|
        link_to event.name, event_path(event.id)
      end
    else
      No past events found!
    end
  end
end
