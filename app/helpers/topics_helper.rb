module TopicsHelper
  def is_user_authorized_for_topics?(action)
    if is_admin_or_moderator(action)
      true
    end
  end
end
