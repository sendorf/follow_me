# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :followed, foreign_key: :followed_id, polymorphic: true
  belongs_to :follower, foreign_key: :follower_id, polymorphic: true
end
