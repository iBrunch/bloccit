module TopicsHelper
  def is_user_authorized_for_topics?(action)
    if check_admin_or_mod(action)
      true
    elsif current_user
      false
    end
  end
end
