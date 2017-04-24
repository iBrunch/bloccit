module PostsHelper
  def user_is_authorized_for_post?(post, action)
    if  current_user && (current_user == post.user || current_user.admin?) || current_user && current_user.moderator? && (action == 'edit')
      true
    else
      false
    end
  end
end
