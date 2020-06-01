module UsersHelper
  def user_invites_action
    html = ''
    @user_invites.each do |invite|
      html += link_to Event.where(id: invite.event_id).first.name, event_path(invite.event_id)
    end
    html.html_safe
  end

  def user_past_events_action
    html = ''
    if @user_past_events.size > 0
      @user_past_events.each do |event|
        html += link_to event.name, event_path(event.id)
      end
    else
      html += "No past events found!"
    end
    html.html_safe
  end

  def user_upcoming_events_action
    html = ''
    if @user_upcoming_events.size > 0
      @user_upcoming_events.each do |event|
        html += link_to event.name, event_path(event.id)
      end
    else
      html += "No upcoming! events found!"
    end
    html.html_safe
  end
end
