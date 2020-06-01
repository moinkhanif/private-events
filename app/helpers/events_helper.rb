module EventsHelper
  def past_events_action
    if @past_events.size.positive?
      @past_events.map { |event| link_to event.name, event_path(event.id) }.join.html_safe
    else
      content_tag(:p) do
        'No past events found!'
      end
    end
  end

  def upcoming_events_action
    if @upcoming_events.size.positive?
      @upcoming_events.map { |event| link_to event.name, event_path(event.id) }.join.html_safe
    else
      content_tag(:p) do
        'No upcoming! events found!'
      end
    end
  end

  def attendees_action
    @event.attendees.map { |i| link_to i.name, user_path(i.id) }.join.html_safe
  end
end
