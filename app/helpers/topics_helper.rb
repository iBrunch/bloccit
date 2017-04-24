module TopicsHelper
  def is_user_authorized_for_topics?(action)
    if current_user && current_user.admin? || current_user && (current_user.moderator? && action == 'edit')
      true
    end
  end
end
