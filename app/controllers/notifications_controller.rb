class NotificationsController < ApplicationController
  
  def index
    @notifications = current_user.notifications
    respond_to do |format|
      format.js {render partial: "notifications", layout: false }
    end
  end

end
