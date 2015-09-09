class User < ActiveRecord::Base
  authenticates_with_sorcery!


  has_many :places, dependent: :destroy
  has_many :relationships, foreign_key: :follower_id
  has_many :followers, class_name: "Relationship", foreign_key: :followed_id

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true, if: -> { new_record? }
  validates :password_confirmation, presence: true
  validates :nickname, presence: true
  validates :email, uniqueness: true


  def get_followers
    followers = []
    self.followers.each do |f|
      followers << User.find(f.follower_id)
    end
    followers
  end

  def get_subscriptions
    subscriptions = []
    self.relationships.each do |s|
      subscriptions << User.find(s.followed_id)
    end
    subscriptions
  end

end
