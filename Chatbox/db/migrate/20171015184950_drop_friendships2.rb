class DropFriendships2 < ActiveRecord::Migration[5.1]
  def change
  	drop_table :friendships
  end
end
