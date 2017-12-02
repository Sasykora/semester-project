class AddForeignToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :channel_id, :integer
  end
end
