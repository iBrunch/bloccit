module PostsHelper
  def is_user_authorized_for_posts?(post, action)
    if current_user && (current_user == post.user || is_admin_or_moderator(action))
      true
     elsif current_user
      false
    end
  end
end
