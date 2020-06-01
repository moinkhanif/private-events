module EventsHelper
  def past_events_action
    html = ''
    if @past_events.size > 0
      @past_events.each do |event|
        html += link_to event.name, event_path(event.id)
      end
    else
      html += "No past events found!"
    end
    html.html_safe
  end

  def upcoming_events_action
    html = ''
    if @upcoming_events.size > 0
      @upcoming_events.each do |event|
        html += link_to event.name, event_path(event.id)
      end
    else
      html += "No upcoming! events found!"
    end
    html.html_safe
  end

  def attendees_action
    html = ''
    @event.attendees.each do |i|
      html += link_to i.name , user_path(i.id)
    end
    html.html_safe
  end
end
