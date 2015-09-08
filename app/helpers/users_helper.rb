module UsersHelper
  def is_owner?(user)
    if user == current_user
      return true
    end
    false
  end
end
