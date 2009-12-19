# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def session_links
    if logged_in?
      return link_to "sign out", user_session_path, :method=>:delete
    else
      return link_to("sign in", new_user_session_path) + " or " + link_to("register", new_user_path)
    end
  end
  
end
