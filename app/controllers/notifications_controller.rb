class NotificationsController < ApplicationController
  
  def index
    @notifications = current_user.notifications
    respond_to do |format|
      format.js {render partial: "notifications", layout: false }
    end
  end

  def read
    notification = current_user.notifications.find(params[:notification_id])
    authorize(notification, :read?) #just in case
    notification.update_attributes(read: true)
    notification.save
    render nothing: true
  end

end
