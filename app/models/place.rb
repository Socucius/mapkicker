class Place < ActiveRecord::Base
  after_create :send_notifications
  mount_uploader :image, PlaceImageUploader

  belongs_to :user

  validates :image, :content, :title, :coordinates, presence: true

  def owner?(user)
    self.user == user
  end

private

  def send_notifications
    self.user.followers.each do |follower|
      follower.notifications.create(
        message: "#{self.user.nickname} added #{self.title}!"
        )
    end
  end



end
