module Followable
  extend ActiveSupport::Concern
  included do
    has_many :received_follows, as: :followed, class_name: 'Follow', dependent: :destroy
    has_many :sent_follows, as: :follower, class_name: 'Follow', dependent: :destroy

    ### Users ###
    has_many :user_followers, through: :received_follows, source: :follower, source_type: 'User'
    has_many :user_followeds, through: :sent_follows, source: :followed, source_type: 'User'

    ### Clubs ###
    has_many :club_followers, through: :received_follows, source: :follower, source_type: 'Club'
    has_many :club_followeds, through: :sent_follows, source: :followed, source_type: 'Club'
  end

  def followers
    (user_followers.to_a + club_followers.to_a).sort_by(&:name)
  end

  def followeds
    (user_followeds.to_a + club_followeds.to_a).sort_by(&:name)
  end

  def type
    self.class.name
  end
end