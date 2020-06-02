module UsersHelper
  def user_invites_action
    @user_invites.map { |invite| link_to Event.where(id: invite.event_id).first.name, event_path(invite.event_id) }.join.html_safe
  end

  def user_past_events_action
    if @user_past_events.size.positive?
      @user_past_events.map { |event| link_to event.name, event_path(event.id) }.join.html_safe
    else
      content_tag(:p) do
        'No past events found!'
      end
    end
  end

  def user_upcoming_events_action
    if @user_upcoming_events.size.positive?
      @user_upcoming_events.map { |event| link_to event.name, event_path(event.id) }.join.html_safe
    else
      content_tag(:p) do
        'No upcoming! events found!'
      end
    end
  end
end
