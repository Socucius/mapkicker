class User < ActiveRecord::Base
  authenticates_with_sorcery!


  has_many :places, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_many :subscriptions, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, class_name: "Relationship", foreign_key: :followed_id

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true, if: -> { new_record? }
  validates :password_confirmation, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :email, uniqueness: true


  def get_followers
    followers = []
    self.followers.each do |f|
      followers << f.follower_id
    end
    User.find(followers)
  end

  def get_subscriptions
    subscriptions = []
    self.subscriptions.each do |s|
      subscriptions << s.followed_id
    end
    User.find(subscriptions)
  end

  def is_followed_by?(user)
    Relationship.find_by(follower_id: user.id, followed_id: self.id)
  end

end
