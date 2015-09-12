module UsersHelper
  
  def is_owner?(user)
    if user == current_user
      return true
    end
    false
  end

  def init_data
    if current_user
      current_user.id
    else
      -1
    end
  end

end
