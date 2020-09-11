class AddTypes2Follows < ActiveRecord::Migration[6.0]
  def change
    add_column :follows, :follower_type, :string
    add_column :follows, :followed_type, :string

    remove_index :follows, [:followed_id, :follower_id]
    add_index :follows, [:followed_id, :followed_type, :follower_id, :follower_type], unique: true, name: 'followed_follower'
  end
end
