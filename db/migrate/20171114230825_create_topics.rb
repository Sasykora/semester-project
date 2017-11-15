class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :name
      t.datetime :lastpost

      t.timestamps
    end
  end
end
