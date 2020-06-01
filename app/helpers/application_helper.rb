module ApplicationHelper
  def menu_action
    html = ''
    if current_user
      html += link_to "Profile", user_path(current_user)
      html += link_to "Create Event", new_event_path
      html += link_to "Logout", logout_path
    else
      html += link_to "Login", login_path
      html += link_to "Sign Up", signup_path
    end
    html.html_safe
  end
end
