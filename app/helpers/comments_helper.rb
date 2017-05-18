module CommentsHelper
  def is_user_authorized_for_comment?(comment)
    if current_user && (current_user == comment.user || current_user.admin?)
      true
    end
  end
end
