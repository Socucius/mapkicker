class Place < ActiveRecord::Base
  after_create :send_notifications

  belongs_to :user



  def owner?(user)
    self.user == user  
  end

private

  def send_notifications
    followers = self.user.get_followers
    followers.each do |follower|
      follower.notifications.create(
        message: "#{self.user.nickname} added new place"
        )
    end
  end



end
