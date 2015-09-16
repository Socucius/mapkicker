module ApplicationHelper
  def user_class
    if params[:controller] == "users"
      "user"
    end
  end
end
