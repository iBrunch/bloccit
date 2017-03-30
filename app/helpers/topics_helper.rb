module TopicsHelper
  def user_is_authorized_for_topics?
    unless current_user && current_user.admin?
      if current_user.moderator? && action == 'edit'
        true
      end
    end
  end
end
