module EventsHelper
  def past_events_action
    if @past_events.size > 0
      @past_events.map do |event|
        link_to event.name, event_path(event.id)
      end.join.html_safe
    else
      content_tag(:p) do
        "No past events found!"
      end
    end
  end

  def upcoming_events_action
    if @upcoming_events.size > 0
      @upcoming_events.map do |event|
        link_to event.name, event_path(event.id)
      end.join.html_safe
    else
      content_tag(:p) do
        "No upcoming! events found!"
      end
    end
  end

  def attendees_action
    html = ''
    @event.attendees.each do |i|
      html += link_to i.name , user_path(i.id)
    end
    html.html_safe
  end
end
