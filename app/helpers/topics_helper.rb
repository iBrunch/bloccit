module TopicsHelper
  def user_is_authorized_for_topics?(action)
    if current_user.admin? || current_user.admin?
      true
    elsif current_user.moderator? && action == 'edit'
      true
    else
      false
    end
  end
end
