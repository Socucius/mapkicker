class Notification < ActiveRecord::Base
  belongs_to :user

  default_scope { where(read: false) }

end
