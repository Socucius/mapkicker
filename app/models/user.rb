class User < ActiveRecord::Base
  authenticates_with_sorcery!


  has_many :places, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :relationships_reverse, foreign_key: :followed_id, 
                                                 class_name: "Relationship",
                                                 dependent: :destroy

  has_many :subscriptions, through: :relationships, source: :followed
  has_many :followers, through: :relationships_reverse, source: :follower

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true, if: -> { new_record? }
  validates :password_confirmation, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :email, uniqueness: true



#Потом перепишу контроллеры, пока так
  def get_followers
    self.followers
  end

  def get_subscriptions
    self.subscriptions
  end
##

  def is_followed_by?(user)
    Relationship.find_by(follower_id: user.id, followed_id: self.id)
  end

end
