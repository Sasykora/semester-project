class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  def self.get_posts_for_show_table(sort)
    @posts = Post.joins("INNER JOIN topics ON posts.topic_id = topics.id")
    if sort == "date-asc" then
      @posts = @posts.order("posts.created_at asc")
    end
    if sort == "date-desc" then
      @posts = @posts.order("posts.created_at desc")
    end
    if sort == "user-asc" then
      @posts = @posts.order("posts.user_id asc")
    end
    if sort == "user-desc" then
      @posts = @posts.order("posts.user_id desc")
    end
    if sort == "channel-asc" then
      @posts = @posts.order("topics.channel_id asc")
    end
    if sort == "channel-desc" then
      @posts = @posts.order("topics.channel_id desc")
    end
    return @posts
  end


end
