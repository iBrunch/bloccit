module CommentsHelper
  def user_is_authorized_for_comment?(comment)
    if current_user && (current_user == comment.user || current_user.admin?)
      true
    end
  end
end
