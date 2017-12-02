class Channel < ApplicationRecord
  has_many :topics

  def self.get_posts_by_day_for_channel(channel_id)
    @channel = Channel.find_by_id(channel_id)
    @posts = nil
    

    return @posts
  end


end
