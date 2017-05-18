module UsersHelper
  def is_user_comments_not_zero(user)
    @comments = user.comments.count
    if @comments != 0
      true
    end
  end
  
  def is_user_posts_not_zero(user)
    @posts = user.posts.count
    if @posts != 0
      true
    end
  end  
  
  def is_user_favorites_not_zero(user)
    @favorites = user.favorite_posts.count
    if @favorites != 0
      true
    end
  end
end
