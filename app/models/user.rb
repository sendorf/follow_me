class User < ApplicationRecord
  self.implicit_order_column = "created_at"

  validates_presence_of :firstname
  validates_presence_of :lastname

  has_many :received_follows, foreign_key: :followed_id, class_name: "Follow", dependent: :destroy
  has_many :followers, through: :received_follows, source: :follower

  has_many :sent_follows, foreign_key: :follower_id,  class_name: "Follow", dependent: :destroy
  has_many :followeds, through: :sent_follows, source: :followed

  def name
    firstname + ' ' + lastname
  end
end
