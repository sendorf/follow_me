class AddIndexes2UsersAndFollows < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :created_at
    add_index :follows, [:followed_id, :follower_id], unique: true
    add_index :follows, :followed_id
    add_index :follows, :follower_id
  end
end
