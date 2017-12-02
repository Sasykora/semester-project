# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'securerandom'

#destroy previously generated records and start fresh
Group.all.destroy_all
User.all.destroy_all
Channel.all.destroy_all
Topic.all.destroy_all
Post.all.destroy_all
puts "Database was cleared."

#generate groups
Group.create(:id => 1, :name => "User", :permissionlevel => 1)
Group.create(:id => 2, :name => "Board Manager", :permissionlevel => 2)
Group.create(:id => 3, :name => "Company manager", :permissionlevel => 3)
@no_groups = Group.all.count
puts @no_groups.to_s + " groups were generated."

#Generate users
User.create(:id => 1, :name => "User 1", :group_id => 1)
User.create(:id => 2, :name => "User 2", :group_id => 1)
User.create(:id => 3, :name => "User 3", :group_id => 1)
User.create(:id => 4, :name => "User 4", :group_id => 1)
User.create(:id => 5, :name => "User 5", :group_id => 1)
User.create(:id => 6, :name => "Board Manager 1", :group_id => 2)
User.create(:id => 7, :name => "Company Manager 1", :group_id => 3)
@no_users = User.all.count
puts @no_users.to_s + " users were generated."

#Generate random channels
for @id in (1..10) do
  Channel.create(:id => @id, :name => "Channel " + @id.to_s, :description => "Channel " + @id.to_s + " description")
end
@no_channels = Channel.all.count
puts @no_channels.to_s + " channels were generated."

#Generate random topics

for @id in (1..100) do
  @channel_id = rand(1..@no_channels)
  Topic.create(:id => @id, :name => "Topic " + @id.to_s, :channel_id => @channel_id)
end
@no_topics = Topic.all.count
puts @no_topics.to_s + " topics were generated."


#Generate random posts
for @id in (1..200) do
  @topic_id = rand(1..@no_topics)
  @user_id = User.where(:group_id => 1).order("RANDOM()").first.id
  @post = Post.create!(:id => @id, :content => "Post " + @id.to_s, :topic_id => @topic_id, :user_id => @user_id)
  @created_at = @post.created_at - rand(0..30).days
  @post.created_at = @created_at
  @post.save  
  if @id % 100 == 0 then puts @id.to_s + " posts added." end
end
@no_posts = Post.all.count
puts @no_posts.to_s + " posts were generated."



