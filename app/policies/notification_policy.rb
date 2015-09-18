class NotificationPolicy < ApplicationPolicy
  attr_reader :user, :notification

  def initialize(user, notification)
    @user = user
    @notification = notification
  end

  def read?
    #just in case
    @user = @notification.user
  end

end
