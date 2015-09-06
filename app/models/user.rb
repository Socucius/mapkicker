class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true, if: -> { new_record? }
  validates :password_confirmation, presence: true
  validates :nickname, presence: true
  validates :email, uniqueness: true

end
