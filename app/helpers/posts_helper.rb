module PostsHelper
  def user_is_authorized_for_posts?(post, action)
    if current_user && (current_user == post.user || check_admin_or_mod(action))
      true
     elsif current_user
      false
    end
  end
end
