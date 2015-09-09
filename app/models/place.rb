class Place < ActiveRecord::Base
  belongs_to :user



  def owner?(user)
    self.user == user  
  end


end
