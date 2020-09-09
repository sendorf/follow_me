class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows, id: :uuid do |t|
      t.uuid :follower_id
      t.uuid :followed_id

      t.timestamps
    end
  end
end
